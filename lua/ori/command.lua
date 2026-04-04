local M = {}
local hl = require('ori.highlight')
local file = require('ori.file')
---@diagnostic disable: undefined-global
local hsluv = hsluv or require('ori.hsluv')

local CURRENT_FILE = debug.getinfo(1, 'S').source:sub(2)
local SOURCE_DIR = CURRENT_FILE:match('^(.-)[/\\][^/\\]+$') or ''
local USER_COLORS_DIR = SOURCE_DIR .. '/colors/user'

---@param msg string
---@param level? "INFO"|"ERROR"|"WARN"|"DEBUG"|"TRACE"
local notify = function(msg, level)
  vim.schedule(function()
    vim.notify(msg, vim.log.levels[level or 'INFO'], {})
  end)
end

---@param target number Hue (0-360)
---@param base number Base hue (0-360)
---@param blend number Blend ratio (0-1)
---@return number hue The blended hue (0-360).
local function blend_hue(target, base, blend)
  local diff = base - target

  if diff > 180 then
    diff = diff - 360
  elseif diff < -180 then
    diff = diff + 360
  end

  return (target + diff * blend) % 360
end

---@param target number Luminance (0-100)
---@param base number Base luminance (0-100)
---@param delta number Adjustment ratio
---@return number luminance The adjusted luminance (0-100).
local function blend_luminance(target, base, delta)
  local diff = target - base
  local new_l = target - (diff * delta)
  return math.max(0, math.min(100, new_l))
end

---@param target number[] HSLuv values {h, s, l}
---@param base number[] Base HSLuv values {h, s, l}
---@param raw_ratio table {h: number, s: number, l: number} (User input -10 to 10)
---@param mode "light"|"dark"
---@return string hex The resulting hex color string.
local function mix_hsl(target, base, raw_ratio, mode)
  local h_target, s_target, l_target = target[1], target[2], target[3]
  local h_base, _s_base, l_base = base[1], base[2], base[3]

  local ratio = {
    h = raw_ratio.h / 10,
    s = raw_ratio.s / 10,
    l = raw_ratio.l / 10,
  }

  local h_diff = math.abs(h_target - h_base)

  if h_diff > 180 then
    h_diff = 360 - h_diff
  end

  local h_blend = ratio.h

  if h_diff > 90 then
    h_blend = ratio.h * 0.5
  end

  local h = blend_hue(h_target, h_base, h_blend)
  local s = math.max(0, math.min(100, s_target * (1 + ratio.s) + (ratio.s * 10)))
  local l_delta = (mode == 'dark') and -ratio.l or ratio.l
  local l = blend_luminance(l_target, l_base, l_delta)

  if ratio.s < 0 then
    local compensation = math.abs(ratio.s) * 8
    l = (mode == 'dark') and math.min(95, l + compensation) or math.max(5, l - compensation)
  end

  if math.abs(l - l_base) < 15 then
    l = l_base > 50 and l - 10 or l + 10
  end

  return hsluv.hsluv_to_hex({ h, s, l })
end

---@param palette table<string,string>
---@param bg_hex string
---@param opts WizardResult
---@return string[] palette_lines List of strings for the new palette file.
function M.harmonize_palette(palette, bg_hex, opts)
  local fmt_rgb = '  %s = "#%02x%02x%02x",'
  local fmt_hex = '  %s = "%s",'
  local bg_group_rgx = vim.regex([[^\(shade\|diff\|nc\|float\|selection\|border\)]])
  local base_rgb = hl.to_rgb(bg_hex)
  local base_hsl = hsluv.hex_to_hsluv(bg_hex)
  local combine = hl.combine(opts.mode)

  local _palette = vim.deepcopy(palette)
  local new_palette = {
    ('-- BG:%s, H:%s, S:%s, L:%s'):format(bg_hex, opts.h, opts.s, opts.l),
    'local palette = {',
  }

  table.insert(new_palette, fmt_hex:format('bg', bg_hex))
  _palette.bg = nil

  local keys = vim.tbl_keys(_palette)
  table.sort(keys)

  for _, name in ipairs(keys) do
    local hex = _palette[name]

    if name == 'highlight' then
      local r, g, b = combine(hl.to_rgb(hex), base_rgb, 0.8)
      table.insert(new_palette, fmt_rgb:format(name, r, g, b))
    elseif bg_group_rgx:match_str(name) then
      local r, g, b = combine(hl.to_rgb(hex), base_rgb, 0.9)
      table.insert(new_palette, fmt_rgb:format(name, r, g, b))
    else
      local hsl = hsluv.hex_to_hsluv(hex)
      local current_ratio = { h = opts.h, s = opts.s, l = opts.l }

      if name:find('match', 1, true) then
        current_ratio.s = opts.s + 1
      end

      local _hex = mix_hsl(hsl, base_hsl, current_ratio, opts.mode)
      table.insert(new_palette, fmt_hex:format(name, _hex))
    end
  end

  vim.list_extend(new_palette, { '}', 'return palette' })

  return new_palette
end

---@param DEFAULT_PALETTES string[]
---@return string[] list Combined list of default and user palette names.
local function completion_list(DEFAULT_PALETTES)
  local palette_list = vim.deepcopy(DEFAULT_PALETTES)
  vim.fs.find(function(name, _)
    if name:find('.lua', 2, true) then
      table.insert(palette_list, name:sub(1, -5))
    end
    return false
  end, { limit = 100, type = 'file', path = USER_COLORS_DIR })
  return palette_list
end

---@param val string|nil
---@return number ratio Normalised value (-1.0-1.0).
local function norm_val(val)
  if not val or val == '' then
    return 0
  end
  local n = tonumber(val) or 0
  return math.max(-10, math.min(10, n))
end

---@param cmd table Command data from nvim_create_user_command.
---@param DEFAULT_PALETTES string[]
local function switch_theme(cmd, DEFAULT_PALETTES)
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
end

---@class WizardResult
---@field name string
---@field mode "light"|"dark"
---@field colors table<string,string>
---@field hex string
---@field h number
---@field s number
---@field l number

---@param palette_name string|nil
---@param callback fun(result: WizardResult)
local function interactive_wizard(palette_name, callback)
  local ask_name, ask_mode, ask_bg, ask_hue, ask_sat, ask_lum

  ---@param msg? string
  local function _abort(msg)
    if msg then
      notify(msg, 'ERROR')
    else
      vim.api.nvim_echo({ { 'canceled.', 'WarningMsg' } }, false, {})
    end
  end

  ---@param input any
  ---@param is_valid boolean
  ---@param msg string
  ---@return boolean
  local function validate(input, is_valid, msg)
    if not input then
      _abort()
      return false
    end
    if not is_valid then
      _abort(msg)
      return false
    end
    return true
  end

  ask_name = function()
    vim.ui.input({ prompt = 'Create theme name: ' }, function(input)
      if validate(input, input ~= '', 'No palette name was specified.') then
        ask_mode(input)
      end
    end)
  end

  ask_mode = function(name)
    local _input = name:lower()
    local valid_name = _input ~= 'light' and _input ~= 'dark'

    if not validate(_input, valid_name, 'You cannot choose "light" or "dark" as a theme name.') then
      return
    end

    local choice = vim.fn.confirm('Select Mode', '&1:Light\n&2:Dark', 2)
    if choice == 0 then
      _abort()
      return
    end

    local mode = choice == 1 and 'light' or 'dark'
    local modname = ('ori.colors.%s'):format(mode)
    local ok, colors = pcall(require, modname)
    if not ok then
      _abort(('Could not read template "%s.lua"'):format(mode))
      return
    end

    ask_bg(name, mode, colors)
  end

  ask_bg = function(name, mode, colors)
    vim.ui.input({ prompt = 'Background hex: ' }, function(input)
      if input:sub(1, 1) ~= '#' then
        input = '#' .. input
      end
      local is_valid = input and #input == 7
      if validate(input, is_valid, 'An invalid hex-code was specified.') then
        ask_hue(name, mode, colors, input)
      end
    end)
  end

  ask_hue = function(name, mode, colors, hex)
    vim.ui.input({ prompt = 'Hue Adjust [-10 - [0]:Default - 10]: ' }, function(input)
      local h = norm_val(input)
      if validate(input, h ~= nil, 'Invalid hue ratio.') then
        ask_sat(name, mode, colors, hex, h)
      end
    end)
  end

  ask_sat = function(name, mode, colors, hex, h)
    vim.ui.input({ prompt = 'Saturation Adjust [-10:Dull - [0]:Default - 10:Vivid]: ' }, function(input)
      local s = norm_val(input)
      if validate(input, s ~= nil, 'Invalid saturation ratio.') then
        ask_lum(name, mode, colors, hex, h, s)
      end
    end)
  end

  ask_lum = function(name, mode, colors, hex, h, s)
    vim.ui.input({ prompt = 'Luminance Adjust [-10:Dark - [0]:Default - 10:Light]: ' }, function(input)
      local l = norm_val(input)
      if validate(input, l ~= nil, 'Invalid luminance ratio.') then
        callback({
          name = name,
          mode = mode,
          colors = colors,
          hex = hex,
          h = h,
          s = s,
          l = l,
        })
      end
    end)
  end

  if not palette_name or palette_name == '' then
    ask_name()
  else
    ask_mode(palette_name)
  end
end

---@param cmd table Command data.
local function create_palette(cmd)
  interactive_wizard(cmd.args, function(res)
    if vim.fn.isdirectory(USER_COLORS_DIR) == 0 then
      vim.fn.mkdir(USER_COLORS_DIR, 'p')
    end
    local palette = M.harmonize_palette(res.colors, res.hex:upper(), res)
    local path = ('%s/%s.lua'):format(USER_COLORS_DIR, res.name)

    if file.write(path, palette) then
      local user_mod = ('ori.colors.user.%s'):format(res.name)
      package.loaded[user_mod] = nil
      local conf = require('ori.config').opts
      conf.background = res.mode
      require('ori').load(res.name)
      notify('Palette created: ' .. res.name, 'INFO')
    else
      notify('Failed to write file.', 'ERROR')
    end
  end)
end

local function delete_palette()
  local paths = {}

  for name, type in vim.fs.dir(USER_COLORS_DIR, {}) do
    if type == 'file' and name ~= '.gitignore' then
      table.insert(paths, name)
    end
  end

  if #paths == 0 then
    notify('No user palettes found.')
    return
  end

  vim.ui.select(paths, { prompt = 'Delete palette: ' }, function(choice)
    if not choice then
      return
    end

    local path = ('%s/%s'):format(USER_COLORS_DIR, choice)
    if vim.fn.delete(path) == 0 then
      notify('Deleted: ' .. choice)
    else
      notify('Could not delete.', 'ERROR')
    end
  end)
end

---Setup user commands
---@param UNIQUE_NAME string The plugin prefix for notifications.
---@param DEFAULT_PALETTES string[] List of built-in palette names.
function M.setup(UNIQUE_NAME, DEFAULT_PALETTES)
  notify = function(msg, level)
    vim.notify(msg, vim.log.levels[level or 'INFO'], { title = UNIQUE_NAME })
  end

  vim.api.nvim_create_user_command('OriSwitchTheme', function(cmd)
    switch_theme(cmd, DEFAULT_PALETTES)
  end, {
    desc = 'Switch theme',
    nargs = '?',
    complete = function(a, _, _)
      return vim.tbl_filter(function(item)
        return vim.startswith(item, a)
      end, completion_list(DEFAULT_PALETTES))
    end,
  })

  vim.api.nvim_create_user_command('OriCreatePalette', create_palette, {
    nargs = '?',
    desc = 'Create a color palette',
  })

  vim.api.nvim_create_user_command('OriDeletePalette', delete_palette, {
    desc = 'Delete a color palette',
  })
end

return M
