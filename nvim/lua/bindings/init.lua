vim.g.mapleader = " "

require("bindings.clipboard")
require("bindings.splits")

-- Save focused file
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true })

-- Convert Jira URL to markdown link: https://*.atlassian.net/browse/ABC-1040 → [ABC-1040](url)
vim.keymap.set(
  "n",
  "<leader>j",
  ":s/\\(](\\)\\@<!\\(https:\\/\\/[^\\.]*\\.atlassian\\.net\\/browse\\/\\([^ ]*\\)\\)/[\\3](\\2)/g<CR>",
  { noremap = true }
)
