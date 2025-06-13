-- Shared settings
vim.lsp.config(
  '*',
  {
		root_markers = {".git"},
  }
)

-- Show warnings in-line
vim.diagnostic.config({virtual_text = true})

-- Python LSP
vim.lsp.enable("pyright")

-- Terraform LSP
vim.lsp.enable("terraformls")
