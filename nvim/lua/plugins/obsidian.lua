vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/epwalsh/obsidian.nvim",
})
require("obsidian").setup({
  workspaces = { {
    name = "notes",
    path = "~/notes",
  } },
  daily_notes = {
    folder = "daily",
  },
  notes_subdir = "scratch",
  follow_url_func = function(url)
    vim.ui.open(url)
  end,
  note_id_func = function(title)
    if title == nil then
      return tostring(os.time())
    end
    return title:gsub("[^a-zA-Z0-9 ]", ""):gsub(" ", "_"):lower()
  end,
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  mappings = {
    -- Follow link under cursor, passthrough to normal gf if not a link
    gf = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
})
vim.keymap.set("n", "<leader>nf", ":ObsidianQuickSwitch<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ng", ":ObsidianSearch<CR>", { noremap = true })
vim.keymap.set("n", "<leader>nh", ":ObsidianTOC<CR>", { noremap = true })
vim.keymap.set("n", "<leader>nn", function()
  local subject = vim.fn.input("Note: ")
  if subject == "" then
    return
  end
  vim.cmd("ObsidianNew " .. subject)
end, { desc = "Obsidian: new note" })
