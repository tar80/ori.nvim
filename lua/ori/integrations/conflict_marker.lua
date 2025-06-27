return function(opts, colors, p)
  vim.g.conflict_marker_highlow_group = ''
  p['ConflictMarkerBegin'] = { fg = colors.fg, bg = colors.high_green }
  p['ConflictMarkerOurs'] = { fg = colors.green, bg = colors.shade_green }
  p['ConflictMarkerTheirs'] = { fg = colors.blue, bg = colors.shade_cyan }
  p['ConflictMarkerEnd'] = { fg = colors.fg, bg = colors.high_blue }
  p['ConflictMarkerSeparator'] = { fg = colors.fg, bg = colors.high_red }
  p['ConflictMarkerCommonAncestors'] = { fg = colors.fg, bg = colors.high_red }
  p['ConflictMarkerCommonAncestorsHunk'] = { fg = colors.high_red, bg = colors.shade_red }

  return p
end
