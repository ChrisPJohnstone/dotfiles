vim.pack.add({"https://github.com/nvim-lua/plenary.nvim"})
vim.pack.add({"https://github.com/nvim-telescope/telescope.nvim"})
require("telescope").setup({
	pickers = {
		colorscheme = { theme = "ivy", enable_preview = true },
		find_files = { theme = "ivy", hidden = true },
		buffers = { theme = "ivy" },
		help_tags = { theme = "ivy" },
		live_grep = { theme = "ivy" },
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
