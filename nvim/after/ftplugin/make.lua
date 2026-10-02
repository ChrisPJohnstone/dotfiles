-- Treesitter
vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

-- Indentation settings
vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
