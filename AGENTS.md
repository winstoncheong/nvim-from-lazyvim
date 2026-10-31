# AGENTS.md

LazyVim starter fork. Keep changes minimal and portable (Windows + Unix paths).

## Paths (Windows example, use `stdpath()` in code)

- Config repo: `%LOCALAPPDATA%/nvim` (`vim.fn.stdpath("config")`) — this git repo.
- Data (not in git): `%LOCALAPPDATA%/nvim-data` (`stdpath("data")`)
  - Plugins: `nvim-data/lazy/`
  - Mason: `nvim-data/mason/packages/` (`texlab`, `ltex-ls-plus`, etc.)
  - Vim spell: `nvim-data/site/spell/en.utf-8.add` (`zg` target when `spellfile` empty)
  - ltex_extra files: `nvim-data/ltex/` (if `path = stdpath("data").."/ltex"`)
- Never commit `nvim-data/`. Do commit `lazyvim.json`, `lazy-lock.json`, `lua/plugins/*.lua`.

## Commands (Nvim 0.12)

- `:Lazy sync` after `lua/plugins/*.lua` or `lazyvim.json` change. `:Lazy reload <name>` for single plugin.
- LSP: `:Lsp restart` (space, not `:LspRestart`), `:Lsp info`, `:checkhealth vim.lsp`, or `<leader>cl` (Snacks Lsp picker). `:LspInfo` / `:LspRestart` do not exist.
- Full fast restart: `:restart`. `vimtex` (`lazy=false`) and first-install `snacks.scroll` prefer a restart.
- LaTeX verify: `:VimtexInfo` in a `.tex` buffer, `:Mason` for `texlab`.
- Headless check: `nvim --headless -c 'lua ...' -c 'qa!'`. Note: LSP clients only attach with a real buffer open; `ltex-ls-plus` (Java) takes 10-15s.

## LazyVim specifics in this repo

- Extra enabled in `lazyvim.json`: `lazyvim.plugins.extras.lang.tex` → `vimtex` + TreeSitter `bibtex`/`latex` + `texlab` keys.
- `wrap_spell` autocmd enables `spell` for `text,plaintex,markdown,...` but NOT `tex` — enable manually with `<leader>us` if Vim spell needed in `.tex`.
- Two spell layers: Vim `spell` (`zg` → `spell/*.add`) vs `ltex-ls-plus` diagnostics (ignores `zg`, needs `ltex.dictionary` or `ltex_extra.nvim` code action).
- `lspconfig` server name for Plus fork is `ltex_plus` (not `ltex`). `ltex_extra.nvim` implements off-spec `addToDictionary` / `hideFalsePositive` / `disableRule`; without it `<leader>ca` errors with "command not supported".
- UI: `snacks.scroll.enabled=false` in `lua/plugins/snacks.lua` for instant `<C-u>/<C-d>`.

## Git workflow

- `origin` = user fork. Starter history was squashed to single `Initial commit`; do not re-add upstream history.
- Stage with `git add -A`, commit with `feat:/fix:` prefix, `git push -u origin main`.
