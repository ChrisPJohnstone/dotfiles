-- Set <C-W>n to vertical split
vim.api.nvim_set_keymap("n", "<C-W>n", ":vnew<CR>", {noremap = true})

-- Enable resizing with Ctrl + hjkl
vim.api.nvim_set_keymap("n", "<C-W><C-h>", "<C-W><", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-W><C-j>", "<C-W>+", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-W><C-k>", "<C-W>-", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-W><C-l>", "<C-W>>", {noremap = true})

-- Open terminal in bottom split
vim.keymap.set("n", "<C-W>t", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.cmd.term()
end)
