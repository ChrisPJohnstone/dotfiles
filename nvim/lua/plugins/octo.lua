vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
local os = vim.loop.os_uname().sysname
if os ~= "Linux" then
  vim.pack.add({ "https://github.com/pwntester/octo.nvim" })
  require("octo").setup()
end
