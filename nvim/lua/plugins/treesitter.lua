vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
require("nvim-treesitter").setup({
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
