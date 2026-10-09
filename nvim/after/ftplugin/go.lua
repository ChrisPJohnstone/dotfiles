-- Treesitter
vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

-- Set indenting
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Add a vertical ruler at char 80 & make it light grey
vim.opt_local.colorcolumn = "80"
