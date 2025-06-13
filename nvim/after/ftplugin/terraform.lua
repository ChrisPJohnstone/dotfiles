-- Enable terraform language server
vim.lsp.enable("terraformls")

-- Set up autoformat
vim.api.nvim_create_autocmd(
  {"BufWritePre"},
  {
    pattern = {"*.tf", "*.tfvars"},
    callback = function()
      vim.lsp.buf.format()
    end,
  }
)
