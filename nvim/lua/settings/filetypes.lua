-- Configs
vim.cmd("autocmd BufRead,BufNewFile */git/config set filetype=gitconfig")
vim.cmd("autocmd BufRead,BufNewFile */tmux/*.conf set filetype=tmux")

-- SQL Files
vim.cmd("autocmd BufRead,BufNewFile *.ddl set filetype=sql")
