-- SQL Files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ddl", "*.dml" },
  command = "set filetype=sql",
})

-- JSON Lines
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.jsonl",
  command = "set filetype=json",
})

-- Git Config
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/git/config",
  command = "set filetype=gitconfig",
})

-- Tmux Config
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/tmux/*.conf",
  command = "set filetype=tmux",
})
