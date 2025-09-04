-- Set <C-W>n to vertical split
vim.keymap.set("n", "<C-W>n", ":vnew<CR>", { noremap = true })

-- Enable resizing with Ctrl + hjkl
vim.keymap.set("n", "<C-W><C-h>", "<C-W><", { noremap = true })
vim.keymap.set("n", "<C-W><C-j>", "<C-W>+", { noremap = true })
vim.keymap.set("n", "<C-W><C-k>", "<C-W>-", { noremap = true })
vim.keymap.set("n", "<C-W><C-l>", "<C-W>>", { noremap = true })

-- Open terminal in bottom split
vim.keymap.set("n", "<C-W>t", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.cmd.term()
end)

-- Zoom split
vim.keymap.set("n", "<C-W>z", "<C-W>|<C-W>_", { noremap = true })
