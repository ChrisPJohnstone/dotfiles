vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
  formatters_by_ft = {
    c = { "clang-format" },
    json = { "prettier" },
    go = { "gofmt" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "ruff" },
    terraform = { "terraform_fmt" },
    yaml = { "prettier" },
  },
})

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
