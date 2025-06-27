local M = {}

local _default = {
  enable_usercmd = false,
  fade_nc = false,
  theme = {
    light = 'light',
    dark = 'dark'
  },
  transparent = {},
  styles = {
    comments = 'NONE',
    deprecated = 'NONE',
    diagnostics = 'undercurl',
    functions = 'NONE',
    keywords = 'NONE',
    readonly = 'NONE',
    references = 'underline',
    spell = 'undercurl',
    strings = 'NONE',
    variables = 'NONE',
    virtualtext = 'NONE',
  },
  disable = {
    cursorline = false,
    statusline = false,
    tabline = false,
    borders = false,
    eob_lines = false,
  },
  integrations = {
    syntax = true,
    editor = true,
    treesitter = true,
    lsp = true,
    lsp_semantic = true,
  },
  user_integrations = {}
}

---@param user_spec UserSpec
---@return Options
function M.setup(user_spec)
  M.opts = vim.tbl_deep_extend('force', _default, user_spec or {})
  return M.opts
end

return M
