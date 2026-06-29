vim.pack.add({
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/saghen/blink.compat',
})
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  cmdline = { enabled = false },
  signature = { enabled = true },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'obsidian', 'obsidian_new', 'obsidian_tags' },
    providers = {
      obsidian = { name = 'obsidian', module = 'blink.compat.source' },
      obsidian_new = { name = 'obsidian_new', module = 'blink.compat.source' },
      obsidian_tags = { name = 'obsidian_tags', module = 'blink.compat.source' },
    },
  },
})

vim.lsp.config("*", {
  capabilities = cmp.get_lsp_capabilities(),
})
