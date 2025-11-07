vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Disable everything, I just want the diffthis command
require("gitsigns").setup({
  signs_staged_enable = false,
  signcolumn = false,
})

vim.keymap.set('n', '<leader>gd', "<cmd>Gitsigns diffthis develop<CR>")
