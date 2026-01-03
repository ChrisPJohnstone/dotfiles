-- Set indenting
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Disable auto-continuation of comments
vim.opt_local.formatoptions = "jqlc"

-- Fix python indenting for open parens
vim.g.python_indent = {
  open_paren = 'shiftwidth()',
  closed_paren_align_last_line = false,
}

-- Add a vertical ruler at char 80 & make it light grey
vim.opt_local.colorcolumn = "80"

-- Run pytest
vim.keymap.set("n", "<leader>t", ":w | !pytest %<CR>", { noremap = true })
