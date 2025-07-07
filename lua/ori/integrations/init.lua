local M = {}

local function terminal_highlights(colors)
  -- Terminal
  vim.g.terminal_color_0 = colors.float
  vim.g.terminal_color_8 = colors.selection

  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.olive
  vim.g.terminal_color_11 = colors.olive

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan

  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_15 = colors.bg
end

local function mod(name, opts)
  local ok, _mod
  if opts.user_integrations[name] then
    ok, _mod = pcall(require, 'ori.integrations.user.' .. name)
  end
  if not ok then
    ok, _mod = pcall(require, 'ori.integrations.' .. name)
  end
  return ok and _mod
    or function(_, _, p)
      vim.notify(('[ori.nvim] Integration %s is not available.'):format(name), vim.log.levels.WARN, {})
      return p
    end
end

function M.get_highlights(opts, colors, custom_highlights)
  local hlgroups = {}
  local _integrations = vim.deepcopy(opts.integrations)
  local function _get_hlgroups(name)
    hlgroups = vim.tbl_deep_extend('error', hlgroups, mod(name, opts)(opts, colors))
    _integrations[name] = nil
  end
  if opts.integrations.syntax ~= false then
    _get_hlgroups('syntax')
  end
  if opts.integrations.editor ~= false then
    _get_hlgroups('editor')
  end
  if opts.integrations.treesitter ~= false then
    _get_hlgroups('treesitter')
  end
  if opts.integrations.lsp ~= false then
    _get_hlgroups('lsp')
    if opts.integrations.lsp_semantic ~= false then
      _get_hlgroups('lsp_semantic')
    end
  end
  if opts.integrations.nightly == true then
    _get_hlgroups('nightly')
  end
  local plugins = vim.iter(pairs(_integrations)):fold({}, function(p, name, value)
    if value then
      local _mod = mod(name, opts)(opts, colors, p)
      if type(_mod) == 'table' and not vim.tbl_isempty(_mod) then
        p = _mod
      end
    end
    return p
  end)

  terminal_highlights(colors)

  hlgroups = vim.tbl_deep_extend('force', hlgroups, plugins, custom_highlights)

  return hlgroups
end

return M
