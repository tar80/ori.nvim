local M = {}
---@diagnostic disable: undefined-global
local hsluv = hsluv or require('ori.hsluv')
local hl = require('ori.highlight')
local file = require('ori.file')

---Gets the source directory of the current file.
---@return string - The source directory, or an empty string if not found.
local function source_path()
  local source = debug.getinfo(1, 'S').source:sub(2)
  return (source:match('^(.-)[/\\][^/\\]+$') or '')
end

---@param target number The first hue (0-1).
---@param base number The second hue (0-1).
---@param blend number The interpolation factor (0-1).
---@return number hue The blended hue (0-1).
local function blend_hue(target, base, blend)
  local diff = base - target
  local delta = diff * blend

  return (target + delta) % 360
end

---@param target number
---@param base number
---@param delta number
local function blend_luminance(target, base, delta)
  local blend = (target - base) * delta
  local new_l = target - blend
  new_l = math.max(0, math.min(100, new_l))

  return new_l
end

local function mix_hsl(target, base, ratio)
  local h = blend_hue(target[1], base[1], ratio.h)
  local s = math.max(0, math.min(100, target[2] + ratio.s * 100))
  local l = blend_luminance(target[3], base[3], ratio.l)

  return hsluv.hsluv_to_hex({ h, s, l })
end

---@class HarmonizeOptions
---@field mode "light"|"dark"
---@field h number 0-1
---@field s number 0-1
---@field l number 0-1

-- Adjust the palette hue to match the background color
---@param palette table<string,string>
---@param bg_hex string
---@param opts HarmonizeOptions
function M.harmonize_palette(palette, bg_hex, opts)
  local match_ratio = { h = 1, s = 0.2, l = opts.l }
  local new_palette = {
    ('-- %s, h:%s, s:%s, l:%s'):format(bg_hex, opts.h, opts.s, opts.l),
    'local palette = {',
  }
  local fmt_rgb = '  %s = "#%02x%02x%02x",'
  local fmt_hex = '  %s = "%s",'
  local rgx = vim.regex([[^\(shade\|diff\|nc\|float\|selection\|border\)]])
  local base_rgb = hl.to_rgb(bg_hex)
  local base_hsl = hsluv.rgb_to_hsluv(base_rgb)
  local combine = hl.combine(opts.mode, 0.7)

  if palette.bg then
    table.insert(new_palette, fmt_hex:format('bg', bg_hex))
    palette.bg = nil
  end

  for name, hex in pairs(palette) do
    if rgx:match_str(name) then
      local target_rgb = hl.to_rgb(hex)
      local r, g, b = combine(target_rgb, base_rgb)
      table.insert(new_palette, fmt_rgb:format(name, r, g, b))
    else
      local hsl = hsluv.hex_to_hsluv(hex)
      local ratio = name:find('match', 1, true) and match_ratio or opts
      local _hex = mix_hsl(hsl, base_hsl, ratio)
      table.insert(new_palette, fmt_hex:format(name, _hex))
    end
  end

  vim.list_extend(new_palette, { '}', 'return palette' })

  return new_palette
end

---@return string[]
local function _completion_list(DEFAULT_PALETTES)
  local colors_user = ('%s/colors/user'):format(source_path())
  local palette_list = vim.deepcopy(DEFAULT_PALETTES)
  vim.fs.find(function(name, _)
    if name:find('.lua', 2, true) then
      table.insert(palette_list, name:sub(1, -5))
    end
    return false
  end, { limit = 100, type = 'file', path = colors_user })
  return palette_list
end

---Setup user commands
function M.setup(UNIQUE_NAME, DEFAULT_PALETTES)
  local function _notify(msg, level)
    vim.notify(msg, vim.log.levels[level], { title = UNIQUE_NAME })
  end
  vim.api.nvim_create_user_command('OriSwitchTheme', function(cmd)
    local opts = require('ori.config').opts
    local name, bg
    if cmd.fargs[1] then
      name = vim.trim(cmd.args)
      local colors = require(require('ori.colors').get_modname(DEFAULT_PALETTES, name))
      assert(colors, 'The palette could not be loaded.')
      local rgb = hl.to_rgb(colors.bg)
      bg = hl.estimate_bg_mode(rgb)
    else
      bg = vim.go.background == 'light' and 'dark' or 'light'
      name = opts.theme[bg]
    end
    opts.background = bg
    require('ori').load(name)
  end, {
    desc = 'Switch theme',
    nargs = '?',
    complete = function(a, _, _)
      return vim.tbl_filter(function(item)
        return vim.startswith(item, a)
      end, _completion_list(DEFAULT_PALETTES))
    end,
  })
  vim.api.nvim_create_user_command('OriCreatePalette', function()
    local name, hex
    local opts = {}
    vim.ui.input({ prompt = 'Create theme name: ' }, function(input)
      name = input
    end)
    local _input = name:lower()
    if _input == 'light' or _input == 'dark' or _input == '' then
      _notify('You cannot choose "light" or "dark" and "" as new theme name.', 'ERROR')
      return
    end
    local choice = vim.fn.confirm('Select theme-mode', '&1:light\n&2:dark', 2)
    if choice == 0 then
      return
    end
    opts.mode = choice == 1 and 'light' or 'dark'
    local ok1, colors = pcall(require, ('ori.colors.%s'):format(opts.mode))
    if not ok1 then
      local msg1 = ('Could not read template "%s.lua"'):format(opts.mode)
      _notify(msg1, 'ERROR')
      return
    end
    vim.ui.input({ prompt = 'Background hex: ', default = '#' }, function(input)
      hex = input
    end)
    if #hex ~= 7 then
      _notify('An invalid hex-code was specified.', 'ERROR')
      return
    end
    vim.ui.input({ prompt = 'Blend hue ratio [0 to 1]: ', default = '0.1' }, function(input)
      opts.h = tonumber(input)
    end)
    if 0 > opts.h or 1 < opts.h then
      _notify('An invalid hue ratio was specified.', 'ERROR')
      return
    end
    vim.ui.input({ prompt = 'Increase saturation ratio [-1 to 1]: ', default = '0' }, function(input)
      opts.s = tonumber(input)
    end)
    if -1 > opts.s or 1 < opts.s then
      _notify('An invalid saturation ratio was specified.', 'ERROR')
      return
    end
    vim.ui.input({ prompt = 'Blend luminance ratio [-1 to 1]: ', default = '0' }, function(input)
      opts.l = tonumber(input)
    end)
    if -1 > opts.l or 1 < opts.l then
      _notify('An invalid luminance ratio was specified.', 'ERROR')
      return
    end
    local palette = M.harmonize_palette(colors, hex, opts)
    local path = ('%s/colors/user/%s.lua'):format(source_path(), name)

    local ok2, msg2 = file.write(path, palette)
    local level = ok2 and 'INFO' or 'ERROR'
    _notify(msg2, level)
  end, { desc = 'Create a color palette' })

  vim.api.nvim_create_user_command('OriDeletePalette', function()
    local user_dir = ('%s/colors/user'):format(source_path())
    local paths = {}

    for name, type in vim.fs.dir(user_dir, {}) do
      if type == 'file' and name ~= '.gitignore' then
        table.insert(paths, name)
      end
    end

    vim.ui.select(paths, {
      prompt = 'Select theme to delete: ',
    }, function(choice)
      if not choice then
        return
      end

      local path = ('%s/colors/user/%s'):format(source_path(), choice)
      local err = vim.fn.delete(path)
      local msg = err == 1 and 'Could not delete the palette.' or 'Deleted.'

      _notify(msg, 'INFO')
    end)
  end, { desc = 'Delete a color palette' })
end

return M
