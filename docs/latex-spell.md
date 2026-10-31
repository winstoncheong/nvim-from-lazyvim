# LaTeX spell stack

## Components

- `lazyvim.plugins.extras.lang.tex` (`lazyvim.json`): `vimtex` (`lazy=false` for inverse search), TreeSitter `bibtex`+`latex` (TreeSitter `latex` highlight disabled, `vimtex` handles it), `texlab` LSP (`<Leader>K` → vimtex docs).
- `texlab`: completion, build/forward-search (`LspTexlabBuild`, `LspTexlabForward`), diagnostics for LaTeX structure. Not a spellchecker.
- `ltex-ls-plus` (Mason `ltex-ls-plus`): grammar + spell via LanguageTool. Attaches to `tex, bib, markdown, ...`. Slow Java start (~10-15s), normal.
- `barreiroleo/ltex_extra.nvim` (`lua/plugins/tex.lua`): implements off-spec `addToDictionary`, `hideFalsePositive`, `disableRule` so `<leader>ca` works. Dict files under `stdpath("data").."/ltex"`.

## Vim spell vs ltex

| Layer | Add word | Storage | Notes |
|---|---|---|---|
| Vim `spell` | `zg` (`zG` = temp), `zw` mark wrong, `z=` suggest, `]s`/`[s` nav | `spellfile` empty → `nvim-data/site/spell/en.utf-8.add` (outside git) | `wrap_spell` auto-enables for `markdown/plaintex/text` only, not `tex`. Toggle with `<leader>us`. |
| ltex | `<leader>ca` → Add to dictionary (needs `ltex_extra`), or edit `ltex.dictionary` in `lua/plugins/tex.lua` | in-config list + `nvim-data/ltex/*.txt` | Ignores `zg`. Requires `:Lsp restart` after manual edit. |

Current `lua/plugins/tex.lua` example:

```lua
ltex_plus = {
  settings = { ltex = {
    language = "en-US",
    dictionary = { ["en-US"] = { "Voevodsky" } },
  } },
}
```

## Prerequisites (not installed by LazyVim)

TeX distro + `latexmk` on `PATH`, PDF viewer (SumatraPDF on Windows for forward/inverse search), Java (for `ltex-ls-plus`, Mason handles binary).

## Troubleshooting

1. `:VimtexInfo` — compiler/viewer found?
2. `:checkhealth vim.lsp` / `<leader>cl` / `:Lsp info` — both `texlab` and `ltex_plus` attached?
3. Word still flagged after `zg` → it's ltex, add to `ltex.dictionary` or via `<leader>ca`.
4. `<leader>ca` "command not supported" → `ltex_extra.nvim` missing/disabled.
5. `ltex_extra` "Error catching ltex client" on startup → ltex not attached yet (slow start); harmless, `:Lsp info` to confirm then `:Lsp restart`.
6. To version Vim spell: `opt.spellfile = stdpath("config").."/spell/en.utf8.add"`, `:mkspell`, commit `spell/`.
