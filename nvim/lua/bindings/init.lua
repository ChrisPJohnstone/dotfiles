vim.g.mapleader = " "

require("bindings.clipboard")
require("bindings.splits")

-- Save focused file
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true })

-- Convert Jira URL to markdown link: https://*.atlassian.net/browse/VEGA-1040 → [VEGA-1040](url)
vim.keymap.set(
  "n",
  "<leader>j",
  ":s/\\(](\\)\\@<!\\(https:\\/\\/[^\\.]*\\.atlassian\\.net\\/browse\\/\\([^ ]*\\)\\)/[\\3](\\2)/g<CR>",
  { noremap = true }
)
