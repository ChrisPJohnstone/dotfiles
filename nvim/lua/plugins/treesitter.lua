vim.pack.add({ {
  src = "https://github.com/nvim-treesitter/nvim-treesitter",
  version = "main",
} })
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install({
  "bash",
  "editorconfig",
  "go",
  "groovy",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "python",
  "sql",
  "terraform",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
})

-- `shell` and `zsh` are not parser names, so code fences tagged with them
-- get no highlighting unless they are aliased to bash
vim.treesitter.language.register("bash", { "shell", "zsh" })

----------------------------------------------------------------------
-- These should go per filetype, in `after/ftplugin/{filetype}.lua` --
----------------------------------------------------------------------

-- Highlighting
-- vim.treesitter.start()
--
-- Folds
-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'
--
-- Indentation
-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
