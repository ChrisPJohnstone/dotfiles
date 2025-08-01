-- Lua
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Python
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.py" },
  callback = function()
    vim.cmd("silent !black --quiet %")
    vim.cmd("edit!")
  end,
})

-- Terraform
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
