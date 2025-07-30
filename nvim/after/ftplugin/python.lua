-- Set indenting
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Add a vertical ruler at char 80 & make it light grey
vim.opt_local.colorcolumn = "80"

-- Set the python interpreter to python3
vim.g.pyindent_open_paren = 4

-- Run pytest
vim.keymap.set("n", "<leader>t", function()
  local path = vim.fn.expand('%:p')
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.cmd.terminal()
  vim.fn.chansend(vim.bo.channel, { "pytest " .. path})
end)
