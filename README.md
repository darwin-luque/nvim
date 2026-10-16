# Neovim config

A VSCode-familiar Neovim setup: file tree pinned to the right, every open file as a tab
across the top, and treesitter highlighting for 53 languages. Built for someone who lives
in VSCode/Cursor by day and wants the terminal editor to feel like home.

```
 file.lua  × | other.py  × | notes.md  ×          Explorer
───────────────────────────────────────────────  ──────────
                                                │  src/
   your code, with treesitter highlighting      │   lua/
                                                │   ...
───────────────────────────────────────────────  ──────────
 lualine statusline
```

## What's inside

| Piece | Plugin | What it does |
|---|---|---|
| File tree | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Sidebar on the right, opens at startup, follows the current file, git status colors |
| Tab bar | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | One tab per open file, close buttons, mouse-friendly |
| Search | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy file finder, live grep |
| Syntax | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlighting + indent for 53 languages (the `darwinsitter.lua` file) |
| Looks | [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) + [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Colorscheme (transparent background) and statusline |

## Requirements

- **Neovim 0.12 or newer**
- **git** (lazy.nvim installs everything else with it)
- **A [Nerd Font](https://www.nerdfonts.com/)** set in your terminal — without it the icons
  in the tree, tabs, and statusline show up as boxes
- **tree-sitter CLI 0.26.1+** — `brew install tree-sitter-cli`.
  Note: Homebrew's plain `tree-sitter` formula only installs the *library*; the CLI is a
  separate formula, and nvim-treesitter needs the CLI to compile parsers
- **A C compiler** (Xcode Command Line Tools, gcc, or clang) — parsers and telescope's
  native fuzzy matcher are compiled from source
- **`make`, `tar`, `curl`** on your PATH

## Install

```sh
# move any existing config out of the way first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

git clone https://github.com/darwin-luque/nvim.git ~/.config/nvim
nvim
```

## What happens on first launch

1. lazy.nvim bootstraps itself and installs the plugins (`:Lazy` opens its dashboard).
2. nvim-treesitter downloads and compiles the 53 parsers in
   `lua/plugins/darwinsitter.lua`. **This takes a few minutes, once.** After that, startup
   is instant and missing parsers are skipped.
3. If something looks wrong, run `:checkhealth`.

## Keymap cheat sheet

The **leader key is `space`**. (`space cd` means press space, then c, then d.)

| Keys | Action |
|---|---|
| `space cd` | Show/hide the file tree (opens focused, like VSCode's explorer) |
| `Ctrl+P` | Quick open file by name |
| `space ff` / `space fg` | Find files / search text across the project |
| `space fb` / `space fh` | Switch buffers / search help |
| `Tab` / `Shift+Tab` | Next / previous tab (`Ctrl+Tab` also works if your terminal sends it) |
| `space x` | Close the current tab (or click its `×`; right-click closes too) |

Inside the file tree: `Enter` opens, `?` shows every action — `a` new file, `r` rename,
`d` delete, `y`/`x`/`p` copy/cut/paste, `/` filter.

## Editing the language list

The parser list lives in `lua/plugins/darwinsitter.lua`. Add or remove language names from
the [`install()` list](https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md)
and restart — missing parsers are installed automatically.

Treesitter indentation is marked experimental upstream. If a language indents oddly, turn
it off for just that language with a one-liner in `after/ftplugin/<filetype>.lua`:

```lua
vim.bo.indentexpr = ''
```

## Where things live

```
init.lua                  loads the three config modules
lua/config/options.lua    editor settings (indentation, search, splits, mouse)
lua/config/keybinds.lua   leader key + file tree toggle
lua/config/lazy.lua       lazy.nvim bootstrap
lua/plugins/*.lua         one file per plugin
```

## License

[MIT](LICENSE)
