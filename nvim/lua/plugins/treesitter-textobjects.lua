vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })

require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@block.inner"] = "v",
    },
  },
})

vim.keymap.set({ "x", "o" }, "ic", function()
  vim.b.is_code_block_selection = true
  require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
end)

-- Strip the code fence's indentation from yanked code blocks, so the
-- column of the opening ``` becomes column 0
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local is_code_block_yank = vim.b.is_code_block_selection and vim.v.event.operator == "y"
    vim.b.is_code_block_selection = false
    if not is_code_block_yank then
      return
    end

    local fence_line = vim.fn.getline(vim.fn.line("'[") - 1)
    local fence_indent = fence_line:match("^%s*")
    if fence_indent == "" then
      return
    end

    local register = vim.v.event.regname
    local lines = vim.fn.getreg(register, 1, true)
    for index, line in ipairs(lines) do
      if vim.startswith(line, fence_indent) then
        lines[index] = line:sub(#fence_indent + 1)
      end
    end
    vim.fn.setreg(register, lines, vim.v.event.regtype)
  end,
})
