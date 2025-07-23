vim.g.mapleader = " "

require("bindings.splits")

-- Open dir of focused file
vim.keymap.set("n", "<leader>d", ":e %:h<CR>", {noremap = true})

-- Save focused file
vim.keymap.set("n", "<leader>s", ":w<CR>", {noremap = true})

-- Set @f to fold % & take new line
vim.cmd("let @f = 'zf%j'")
