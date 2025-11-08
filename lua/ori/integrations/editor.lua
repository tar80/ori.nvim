---Set the background color to "NONE"
---@param group {[string]: string} Color palette
local function remove_bg(group)
  group['bg'] = 'NONE'
end

return function(opts, colors)
  local editor = {
    ColorColumn = { fg = colors.none, bg = colors.float },
    Conceal = { bg = colors.bg },
    CurSearch = { link = 'IncSearch' },
    Cursor = { fg = colors.fg, style = 'reverse' },
    lCursor = { link = 'Cursor' },
    CursorIM = { fg = colors.fg, style = 'reverse' },
    CursorColumn = { fg = colors.none, bg = colors.float },
    CursorLine = { bg = colors.nc },
    Directory = { fg = colors.blue, bg = colors.none },
    DiffAdd = { bg = colors.diff_add },
    DiffChange = { fg = colors.diff_text, bg = colors.diff_change },
    DiffDelete = { bg = colors.diff_remove },
    DiffText = { fg = colors.diff_text, bg = colors.diff_text_bg },
    --nightly DiffTextAdd = { bg = colors.diff_add },
    EndOfBuffer = { fg = colors.gray },
    TermCursor = { fg = colors.high_purple, sp = colors.high_purple },
    ErrorMsg = { fg = colors.error },
    --nightly StderrMsg = { link = 'ErrorMsg' },
    --nightly StdoutMsg = { link = 'ModeMsg' },
    WinSeparator = { fg = colors.border },
    Folded = { fg = colors.low_blue, bg = colors.none, style = 'italic' },
    FoldColumn = { fg = colors.low_blue },
    SignColumn = { fg = colors.gray, bg = colors.none },
    IncSearch = { fg = colors.high_orange, bg = colors.bg, style = 'reverse' },
    Substitute = { fg = colors.green, bg = colors.bg, style = 'reverse' },
    LineNr = { fg = colors.fg },
    LineNrAbove = { fg = colors.low_gray },
    LineNrBelow = { fg = colors.low_gray },
    CursorLineNr = { fg = colors.cyan },
    --TODO:test
    CursorLineFold = { fg = colors.purple },
    --TODO:test
    CursorLineSign = { fg = colors.red },
    MatchParen = { fg = colors.high_orange, bg = colors.none, sp = colors.high_orange, style = 'underline' },
    -- MessegeWindow = not supported
    ModeMsg = { fg = colors.blue },
    MsgArea = { bg = colors.none },
    MsgSeparator = { bg = colors.none },
    MoreMsg = { fg = colors.blue },
    NonText = { fg = colors.low_cyan },
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.float },
    FloatBorder = { fg = colors.low_gray, bg = colors.bg },
    FloatTitle = { link = 'Normal' },
    FloatFooter = { link = 'Normal' },
    NormalNC = { fg = colors.fg, bg = colors.bg },
    Pmenu = { fg = colors.fg, bg = colors.shade_blue },
    PmenuSel = { bg = colors.matchsub, style = 'bold' },
    PmenuKind = { fg = colors.high_cyan, bg = colors.float },
    PmenuKindSel = { fg = colors.match, bg = colors.shade_cyan, style = 'reverse' },
    PmenuExtra = { fg = colors.comment, bg = colors.float },
    PmenuExtraSel = { fg = colors.match, bg = colors.shade_blue, style = 'reverse' },
    PmenuSbar = { bg = colors.selection },
    PmenuThumb = { bg = colors.matchsub },
    PmenuMatch = { fg = colors.match, style = 'bold' },
    PmenuMatchSel = { fg = colors.match, bg = colors.float, style = 'reverse,bold' },
    ComplMatchIns = { link = 'Search' },
    -- PopupSelected = not supported
    -- PopupNotification = not supported
    Question = { fg = colors.green },
    QuickFixLine = { bg = colors.float, style = 'bold' },
    Search = { fg = colors.orange, bg = colors.highlight, style = 'bold' },
    SnippetTabstop = { link = 'Visual' },
    SpecialKey = { fg = colors.high_blue },
    SpellBad = { fg = colors.red, bg = colors.none, style = opts.styles.spell, sp = colors.red },
    SpellCap = { fg = colors.olive, bg = colors.none, style = opts.styles.spell, sp = colors.olive },
    SpellLocal = { fg = colors.cyan, bg = colors.none, style = opts.styles.spell, sp = colors.cyan },
    SpellRare = { fg = colors.purple, bg = colors.none, style = opts.styles.spell, sp = colors.purple },
    StatusLine = { fg = colors.fg, bg = colors.border, sp = colors.fg },
    StatusLineNC = { fg = colors.high_gray, bg = colors.border, sp = colors.high_gray },
    StatusLineTerm = { fg = colors.fg, bg = colors.border },
    StatusLineTermNC = { fg = colors.high_gray, bg = colors.border },
    TabLine = { fg = colors.high_purple, bg = colors.border },
    TabLineFill = { fg = colors.high_gray, bg = colors.border },
    TabLineSel = { fg = colors.cyan, bg = colors.bg },
    -- Terminal = not supported
    Title = { fg = colors.fg, bg = colors.float, style = 'bold' },
    Visual = { fg = colors.none, bg = colors.selection },
    VisualNOS = { fg = colors.none, bg = colors.selection },
    WarningMsg = { fg = colors.warn },
    Whitespace = { fg = colors.high_gray, bg = colors.border },
    WildMenu = { fg = colors.olive, bg = colors.none, style = 'bold' },
    WinBar = { fg = colors.fg, bg = colors.bg },
    WinBarNC = { fg = colors.high_gray, bg = colors.bg },

    -- GUI
    -- Menu =
    -- Scrollbar =
    -- Tooltip =
  }

  -- Options:
  -- Set non-current fade background
  if opts.fade_nc and not vim.tbl_contains(opts.transparent, 'NormalNC') then
    editor.NormalNC['bg'] = colors.nc
  end

  -- Set transparent cursorline
  if opts.disable.cursorline then
    remove_bg(editor.CursorLine)
  end

  -- Set transparent statusline background
  if opts.disable.statusline then
    remove_bg(editor.StatusLine)
    remove_bg(editor.StatusLineNC)
    remove_bg(editor.StatusLineTerm)
    remove_bg(editor.StatusLineTermNC)
  end

  -- Set transparent tabline background
  if opts.disable.tabline then
    remove_bg(editor.TabLine)
    remove_bg(editor.TabLineSel)
    remove_bg(editor.TabLineFill)
  end

  -- Set transparent window split borders
  if opts.disable.borders then
    editor.WinSeparator['fg'] = colors.bg
  end

  -- Set transparent eob lines
  if opts.disable.eob_lines then
    editor.EndOfBuffer['fg'] = colors.bg
  end

  return editor
end
