local ori = {}
local config = require('ori.config')
local integrations = require('ori.integrations')

local UNIQUE_NAME = 'ori.nvim'
local DEFAULT_PALETTES = { 'dark', 'light' }

---@param user_spec UserSpec
function ori.setup(user_spec)
  local opts = config.setup(user_spec)
  if opts.enable_usercmd then
    require('ori.command').setup(UNIQUE_NAME, DEFAULT_PALETTES)
  end
end

local function set_highlight(hlgroup, param)
  local hl = {}
  if param.link then
    hl['link'] = param.link
  else
    hl = { fg = param.fg, bg = param.bg, sp = param.sp }
    if param.style and param.style:lower() ~= 'none' then
      vim.iter(param.style:gmatch('[^,]+')):each(function(v)
        hl[v] = true
      end)
    end
  end
  vim.api.nvim_set_hl(0, hlgroup, hl)
end

-- Initialization and loading
---@param name? string Palette name
function ori.load(name)
  local opts = config.opts
  if not name then
    local background = opts.background or vim.go.background
    name = background == 'light' and opts.theme.light or opts.theme.dark
  end
  local palette, colors = require('ori.colors').load(UNIQUE_NAME, DEFAULT_PALETTES, name)
  if vim.g.colors_name then
    vim.g.colors_name = nil
    vim.cmd.highlight('clear')
  end
  if vim.fn.exists('syntax_on') then
    vim.cmd.syntax('reset')
  end
  if opts.background then
    vim.go.background = opts.background
    opts.background = nil
  end
  vim.go.termguicolors = true
  vim.g.colors_name = 'ori'
  vim.g.ori_palette = palette
  local user_highlights = opts.custom_highlights
  if type(user_highlights) == 'function' then
    user_highlights = opts.custom_highlights(opts, colors)
  end
  local custom_highlights = user_highlights[vim.go.background] or {}
  local highlights = integrations.get_highlights(opts, colors, custom_highlights)
  if #opts.transparent > 0 then
    vim.iter(opts.transparent):each(function(v)
      highlights[v] = { guibg = 'NONE' }
    end)
  end
  for hlgroup, param in pairs(highlights) do
    set_highlight(hlgroup, param)
  end
  vim.cmd.doautocmd('<nomodeline> ColorScheme')
end

return ori
