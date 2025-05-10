vim.g.mapleader = " "

require("bindings.splits")

-- Open dir of focused file
vim.api.nvim_set_keymap("n", "<leader>d", ":e %:h<CR>", {noremap = true})

-- Save focused file
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", {noremap = true})
