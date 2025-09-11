vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "json",
    "lua",
    "python",
    "sql",
    "tmux",
    "vim",
    "vimdoc",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
})

-- Use treesitter when using expr foldmethod
vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function()
    if require('nvim-treesitter.parsers').has_parser() then
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end
  end,
})
