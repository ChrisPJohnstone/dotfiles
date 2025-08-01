-- Group
vim.api.nvim_create_augroup("AutoFormat", { clear = true })

-- Lua, Terraform
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "AutoFormat",
  pattern = {
    "*.lua",
    "*.tf",
    "*.tfvars",
  },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Python
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "AutoFormat",
  pattern = { "*.py" },
  callback = function()
    vim.cmd("silent !black --quiet %")
    vim.cmd("edit!")
  end,
})
