-- Group
vim.api.nvim_create_augroup("LineNumbers", { clear = true })

-- Enable line numbering in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = "LineNumbers",
  callback = function()
    if vim.bo.buflisted then
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
    end
  end
})

-- Enable relative line numbering for focused window
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  group = "LineNumbers",
  pattern = { "*" },
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

-- Disable relative numbers when leaving a window
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  group = "LineNumbers",
  pattern = { "*" },
  callback = function()
    vim.opt.relativenumber = false
  end,
})
