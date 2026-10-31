# nvim-from-lazyvim

Personal [LazyVim](https://github.com/LazyVim/LazyVim) config (fork of [starter](https://github.com/LazyVim/starter)).
See [LazyVim docs](https://lazyvim.github.io/installation) for base usage, `AGENTS.md` for agent workflow, `docs/latex-spell.md` for spell details.

## What is enabled

- `lazyvim.plugins.extras.lang.tex` (`lazyvim.json`): `vimtex` + TreeSitter `bibtex`/`latex` + `texlab`
- `lua/plugins/tex.lua`: `ltex_plus` `en-US` dictionary + `barreiroleo/ltex_extra.nvim` (makes `<leader>ca` Add to dictionary work)
- `lua/plugins/snacks.lua`: `snacks.scroll.enabled = false` for instant `<C-u>/<C-d>` / PageUp/Down

## Prerequisites (not installed by Lazy)

TeX distro + `latexmk` on `PATH`, PDF viewer (SumatraPDF on Windows), Java for `ltex-ls-plus`.

Verify in a `.tex` buffer: `:VimtexInfo`, `:checkhealth vim.lsp`, `<leader>cl`, `:Mason`.

## Spell notes

Two layers: Vim `spell` (`zg` → `nvim-data/site/spell/`, `<leader>us` to toggle; not auto-on for `tex`) vs `ltex-ls-plus` (needs `ltex.dictionary` or `<leader>ca`). Details in `docs/latex-spell.md`.

## Commands

- `:Lazy sync` after plugin changes, `:Lsp restart` (space, Nvim 0.12), `:restart` for fast full restart.
