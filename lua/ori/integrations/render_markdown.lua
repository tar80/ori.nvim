return function(opts, colors, p)
  p['RenderMarkdownCode'] = { bg = colors.float }
  -- p['RenderMarkdownCodeInline'] = { link = 'RenderMarkdownCode' }
  p['RenderMarkdownH1Bg'] = { fg = colors.bg, bg = colors.high_cyan, style = 'bold' }
  p['RenderMarkdownH2Bg'] = { fg = colors.bg, bg = colors.cyan, style = 'bold' }
  p['RenderMarkdownH3Bg'] = { fg = colors.bg, bg = colors.low_cyan, style = 'bold' }
  p['RenderMarkdownH4Bg'] = { fg = colors.fg, bg = colors.shade_cyan, style = 'bold' }
  p['RenderMarkdownH5Bg'] = { fg = colors.fg, bg = colors.shade_cyan, style = 'bold' }
  p['RenderMarkdownH6Bg'] = { fg = colors.fg, bg = colors.shade_cyan, style = 'bold' }
  p['RenderMarkdownLink'] = { fg = colors.cyan }
  p['RenderMarkdownTodo'] = { link = 'Todo' }
  p['RenderMarkdownDash'] = { fg = colors.shade_gray }
  p['RenderMarkdownTableHead'] = { fg = colors.low_gray }
  p['RenderMarkdownTableRow'] = { fg = colors.low_gray }
  p['RenderMarkdownTableFill'] = { fg = colors.low_gray }
  -- p['RenderMarkdown'] = { link = '' }

  return p
end
