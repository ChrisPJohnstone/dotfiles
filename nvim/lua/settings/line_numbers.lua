-- Default
vim.opt.number = true

-- Group
local line_number_augroup = vim.api.nvim_create_augroup("LineNumbers", { clear = true })

-- Enable line numbering in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = line_number_augroup,
  callback = function()
    if vim.bo.buflisted then
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
    end
  end
})

-- Enable relative line numbering for focused window
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  group = line_number_augroup,
  pattern = { "*" },
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

-- Disable relative numbers when leaving a window
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  group = line_number_augroup,
  pattern = { "*" },
  callback = function()
    vim.opt_local.relativenumber = false
  end,
})
