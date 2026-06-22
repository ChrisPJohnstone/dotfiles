vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/epwalsh/obsidian.nvim"
})
require("obsidian").setup({
  workspaces = { {
    name = "notes",
    path = "~/notes",
  } },
  daily_notes = {
    folder = "daily",
  },
  completion = {
    nvim_cmp = false,
    min_chars = 2,
  },
})
