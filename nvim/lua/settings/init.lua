require("settings.filetypes")
require("settings.lazy")
require("settings.line_numbers")
require("settings.line_wrapping")
require("settings.lsp")
require("settings.splits")
require("settings.status_line")
require("settings.tab")
require("settings.wildignore")
require("settings.wildmenu")

-- Enable syntax highlighting
vim.opt.syntax = on

-- Centre cursor on screen
vim.opt.scrolloff = 999

-- Show unfinished commands
vim.opt.showcmd = true

-- Highlight matches for current search
vim.opt.hlsearch = true

-- Diable mouse interaction
vim.opt.mouse = ""
