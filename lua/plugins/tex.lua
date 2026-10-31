return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex_plus = {
          settings = {
            ltex = {
              language = "en-US",
              dictionary = {
                ["en-US"] = { "Voevodsky" },
              },
            },
          },
        },
      },
    },
  },
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "tex", "plaintex", "bib", "markdown" },
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      load_langs = { "en-US" },
      path = vim.fn.stdpath("data") .. "/ltex",
    },
  },
}
