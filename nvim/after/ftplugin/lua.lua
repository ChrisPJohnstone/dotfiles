-- Treesitter
vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

-- Set indenting
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

-- Set foldlevel
vim.opt_local.foldlevel = 2

-- Disable auto-continuation of comments
vim.opt_local.formatoptions = "jqlc"
