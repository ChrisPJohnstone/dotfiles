-- Shared settings
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- Show warnings in-line
vim.diagnostic.config({ virtual_text = true })

-- Lua LSP
vim.lsp.enable("luals")

-- Python LSP
vim.lsp.enable("pyright")

-- Bash LSP
vim.lsp.enable("bashls")

-- Terraform LSP
vim.lsp.enable("terraformls")
