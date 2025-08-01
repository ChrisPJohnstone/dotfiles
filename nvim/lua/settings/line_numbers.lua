-- Enable line numbering
vim.opt.number = true

-- Enable relative line numbering for focused window
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.opt.relativenumber = true
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
	pattern = { "*" },
	callback = function()
		vim.opt.relativenumber = false
	end,
})
