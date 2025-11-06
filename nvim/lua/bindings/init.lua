vim.g.mapleader = " "

require("bindings.clipboard")
require("bindings.splits")

-- Save focused file
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true })
