-- https://github.com/NStefan002/screenkey.nvim
-- Screenkey seems like a better implementation of this but I'm getting an
-- error when trying to install on mac that I cba debugging right now
vim.pack.add({ "https://github.com/nvzone/showkeys" })
require("showkeys").setup({
  winopts = {
    focusable = false,
    relative = "editor",
    style = "minimal",
    border = "single",
    height = 1,
    row = 1,
    col = 0,
    zindex = 100,
  },
  winhl = "FloatBorder:Comment,Normal:Normal",

  timeout = 3,   -- in secs
  maxkeys = 10,
  show_count = true,
  excluded_modes = {"i"},

  -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
  position = "bottom-right",
})
