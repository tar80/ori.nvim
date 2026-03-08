# ![ori.nvim](https://github.com/user-attachments/assets/0216530d-f5d4-40b2-b760-0332f292b864)

## Requirements

- Neovim >= 0.12.0

## Features

ori.nvim supports creating your own palette based on either the light or dark palette.
By using the **HSLuv** color space, it ensures perceptually uniform brightness when blending colors with your background.
To create a palette, you must specify the palette `name`, `mode`, `background hex`, and `ratio` values.

Here are some sample palettes.

![palettes](https://github.com/user-attachments/assets/b7beda9c-53b0-4a9e-8cdb-ea140867c757)

### Palette colors

In addition to the eight basic colors  
`gray`, `blue`, `cyan`, `green`, `olive`, `orange`, `red`, `purple`  
the plugin has the following component colors:  

|Key         | Description                  |
|:-          |:-                            |
|fg          | Foreground                   |
|bg          | Background                   |
|high_xxx    | High basic colors            |
|low_xxx     | Low basic colors             |
|shade_xxx   | Basic colors for background  |
|nc          | Non-current buffer background|
|float       | Float window                 |
|border      | Buffer border line           |
|selection   | Visual selection background  |
|highlight   | Highlight text               |
|match       | Match item color             |
|matchsub    | Sub-match item color         |
|diff_add    | Added diff range             |
|diff_change | Changed diff range           |
|diff_remove | Removed diff range           |
|diff_text   | Changed text                 |
|diff_text_bg| Changed text background      |

## Commands

- `OriSwitchTheme [<palette>]`
  - Switches between light and dark palettes. You can also specify a specific palette name.
- `OriCreatePalette`
  - Interactive command to generate a new palette harmonized with your chosen background hex.
- `OriDeletePalette`
  - Select and delete a custom palette you created.

## Configuration

<details>
<summary> Click to see default configuration </summary>

```lua
require("ori").setup({
    -- Enable user commands.
    enable_usercmd = false,
    -- Change the background color of other buffers.
    fade_nc = false,
    -- Background color applied at startup. "light"|"dark"
    background = "dark",
    -- Palette name applied to each mode.
    theme = {
        light = "light",
        dark = "dark"
    },
    -- Hlgroups that force bg to "NONE".
    -- To make the background transparent, add the following hlgroups to your settings:
    -- {'Normal', 'NormalNC', 'NormalFloat', 'LineNr', 'SignColumn', 'FloatBorder', 'FloatTitle', 'FloatFooter'}
    --
    transparent = {},
    styles = {
        -- "NONE"|"[bold][,underline][,italic][,...]"]
        comments = "NONE",
        deprecated = "NONE",
        diagnostics = "undercurl",
        functions = "NONE",
        keywords = "NONE",
        readonly = "NONE", -- Used for @lsp.mode.readonly
        references = "underline", -- Used for LspReferenceXXX
        spell = "undercurl",
        strings = "NONE",
        variables = "NONE",
        virtualtext = "NONE",
    },
    disable = {
        borders = false,
        eob_lines = false,
        cursorline = false,
        statusline = false,
        tabline = false,
    },
    --[[ Override or add to default settings. See `nvim_set_hl()`
    --   This is not the default value, it's just a sample.
    custom_highlights = function(opts, colors)
        return {
          light = {
              hlgroup1 = {fg = "#000000", bg = "#FFFFFF", style = "underline"}
              hlgroup2 = {fg = colors.fg, bg = colors.bg, style = opts.styles.keywords}
          },
          dark = {
              hlgroup1 = {fg = "#DFDFDF", bg = "#222222", style = "underline"}
          },
        }
    end,
    --]]
    integrations = {
        -- default hlgroups
        editor = true,
        lsp = true,
        lsp_semantic = true,
        syntax = true,
        treesitter = true,
        nightly = false, -- hlgroups available in nightly build

        -- maintained hlgroups
        blink = false,
        dap = false,
        dap_virtual_text = false,
        flash = false,
        fret = false,
        gitsigns = false,
        lazy = false,
        matchwith = false,
        mini_diff = false,
        mini_icons = false,
        nvim_treesitter = false, ---@depricated
        quicker = false,
        render_markdown = false,
        rereope = false,
        sandwich = false,
        skkeleton_henkan_highlight = false,
        skkeleton_indicator = false,
        snacks = false,
        staba = false,
        trouble = false,

        -- unmaintained hlgroups
        cmp = false,
        conflict_marker = false,
        fuzzy_motion = false,
        lspsaga = false,
        noice = false,
        notify = false,
        rainbow_delimiters = false, -- false|`high`|`low` Can choose one of either "high" or "low" contrast
        telescope = false,
    },
    -- User's own specified plugins highlight groups
    -- Set the plugin name and value in the same way as the "integrations" table.
    -- Place the color scheme settings under `ori.nvim/lua/ori/integrations/user/`
    -- as `<plugin-name>.lua`.
    -- You can also set a value other than nil or false and use it as a flag.
    user_integrations = {},
})
```

</details>
