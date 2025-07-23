-- Bind escape to escape
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")

-- Change to emacs mode when opening terminal
vim.api.nvim_create_autocmd(
  {"TermOpen"},
  {
    callback = function()
      vim.fn.chansend(vim.bo.channel, { "set -o emacs\rclear\r" })
    end,
  }
)
