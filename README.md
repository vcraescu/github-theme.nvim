# GitHub Light for Neovim

A Neovim colorscheme that uses **GitHub Light Default** colors and the
[islands-dark.nvim](https://github.com/vcraescu/islands-dark.nvim) highlight structure.

The plugin requires Neovim 0.9 or later. It has no runtime dependencies.

## Load the theme

Add this directory to your runtime path. Then load the colorscheme:

```lua
vim.opt.runtimepath:prepend("/workspace")
vim.cmd("colorscheme github-light")
```

For a local lazy.nvim installation, use:

```lua
{
  dir = "/workspace",
  name = "github-light.nvim",
  priority = 1000,
  config = function()
    require("github-light").setup({})
    vim.cmd("colorscheme github-light")
  end,
}
```

Replace `/workspace` if you move the plugin.

## Configuration

Call `setup()` before you load the colorscheme. Configuration is optional.

```lua
require("github-light").setup({
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = {},
    variables = {},
  },
  overrides = function(colors)
    return {
      Function = { fg = colors.func, bold = true },
    }
  end,
  on_highlights = function(highlights, colors)
    highlights.FloatBorder = { fg = colors.border }
  end,
})

vim.cmd("colorscheme github-light")
```

All styles are empty by default. The theme applies `overrides` before `on_highlights`.

Use `transparent = true` for transparent editor, floating-window, and folded-text backgrounds. Statusline and diff
backgrounds remain opaque.

Use `terminal_colors = false` to keep your existing ANSI terminal colors.

The theme includes Treesitter, LSP semantic tokens, diagnostics, blink.cmp, Copilot, fzf-lua, nvim-tree, and GitSigns
highlights.

## Colors

These colors come from **GitHub Light Default**, not the older **GitHub Light** theme.

| Role                  | Color     |
| --------------------- | --------- |
| Editor background     | `#FFFFFF` |
| Default text          | `#1F2328` |
| Secondary text        | `#656D76` |
| Comments              | `#6E7781` |
| Keywords              | `#CF222E` |
| Functions             | `#8250DF` |
| Strings               | `#0A3069` |
| Numbers and constants | `#0550AE` |
| Types                 | `#953800` |
| HTML tags             | `#116329` |
| Links                 | `#0969DA` |
| Borders               | `#D0D7DE` |
| Added Git markers     | `#1A7F37` |
| Changed Git markers   | `#9A6700` |
| Deleted Git markers   | `#CF222E` |

Neovim requires opaque highlight colors. The palette composites GitHub alpha colors against the white editor background.
The same colors remain in use when you enable transparency.

Neovim has highlight roles that VS Code does not have. These roles use the nearest GitHub semantic color. Changed diff
lines use GitHub attention backgrounds. Conflict backgrounds use GitHub severe colors.

### Source files

- [`lua/github-light/palette.lua`](lua/github-light/palette.lua): Raw colors, source comments, and opaque alpha colors.
  Primer color-scale indices start at zero.
- [`lua/github-light/colors.lua`](lua/github-light/colors.lua): Semantic colors for highlights and callbacks.
- [`lua/github-light/highlights/`](lua/github-light/highlights/): Editor, syntax, Treesitter, LSP, and plugin
  highlights.
- [`test/fixtures/light-default.json`](test/fixtures/light-default.json): Output from the official GitHub theme
  generator for `theme: "light"` and `name: "GitHub Light Default"`.

### Upstream references

The implementation uses these sources:

- [GitHub theme package](https://github.com/primer/github-vscode-theme/blob/cd78e5e4e7bcf132a6f428ae0f32264bb1b729cf/package.json):
  Version 6.3.5. The package identifies **GitHub Light Default** as `themes/light-default.json`.
- [GitHub highlight mappings](https://github.com/primer/github-vscode-theme/blob/cd78e5e4e7bcf132a6f428ae0f32264bb1b729cf/src/theme.js).
- [GitHub palette overrides](https://github.com/primer/github-vscode-theme/blob/cd78e5e4e7bcf132a6f428ae0f32264bb1b729cf/src/colors.js):
  Includes the current `#1F2328` default text and `#656D76` secondary text.
- [Primer light palette, version 7.10.0](https://unpkg.com/@primer/primitives@7.10.0/dist/json/colors/light.json).
- Islands Dark source: `/repos/vcraescu/islands-dark.nvim`, commit `4ff585fbb441b48f3ac7acd1e814d430cc387ce7`.

The fixture uses Primer 7.10.0 and chroma-js 2.4.2, as permitted by the official generator dependencies. Neither package
is required to load or test this plugin.

## Checks

Run the checks from this directory:

```bash
nvim --headless -u NONE -i NONE -l test/check_theme.lua
stylua --check --column-width 120 lua colors test/check_theme.lua
```

The checks compare colors against the GitHub source fixture. They also check transparency, callbacks, styles, linked
highlights, plugin groups, terminal colors, and repeated loads.

## License

MIT. See [LICENSE](LICENSE) for the Islands Dark code license.
