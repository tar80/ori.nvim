local M = {}

---Get palette name
---@param name string
---@return string `Palette name`
function M.get_modname(DEFAULT_PALETTES, name)
  local has_palette = vim.iter(DEFAULT_PALETTES):find(name)
  if not has_palette then
    name = string.format('user.%s', name)
  end
  return string.format('ori.colors.%s', name)
end

---Get highlights details
---@param UNIQUE_NAME string
---@param DEFAULT_PALETTES string[]
---@param name string Palette name
---@return string, table `Color theme`, `Color palette`
function M.load(UNIQUE_NAME, DEFAULT_PALETTES, name)
  ---@type boolean, table
  local ok, colors = pcall(require, M.get_modname(DEFAULT_PALETTES, name))
  if not ok then
    local msg = ('[%s] The theme "%s" is not exists.'):format(UNIQUE_NAME, name)
    assert(false, msg)
  end
  return name, colors
end

return M
