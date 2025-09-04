-- Set fold text to show first line (left) and number of lines in fold (right)
function MyFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local count = vim.v.foldend - vim.v.foldstart + 1
  local count_string = count .. ' lines'
  local window_width = vim.fn.winwidth(0)
  local padding = string.rep(' ', window_width - string.len(line) - string.len(count_string) - 4)
  return line .. padding .. count_string
end

vim.opt.foldtext = 'v:lua.MyFoldText()'

-- Use treesitter when using expr method
vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function()
    if require('nvim-treesitter.parsers').has_parser() then
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end
  end,
})
