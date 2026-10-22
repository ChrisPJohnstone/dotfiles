vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", })


require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  }
})
vim.keymap.set({ "n", "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
end)
