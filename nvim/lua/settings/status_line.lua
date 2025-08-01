-- Set status bar
vim.opt.statusline = "[%f] %y %m %= [Column: %v]"

-- [%f]   [filename]
-- %y     File type (already in square brackets)
-- %m     Shows [+] if file has unsaved changes
-- %=     Switches to right align
-- %v     Column number for cursor position
