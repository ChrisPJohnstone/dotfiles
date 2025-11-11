local function get_system_register()
  local uname = vim.loop.os_uname().sysname
  if uname == 'Darwin' then
    return '*'
  else
    return '+'
  end
end

local system_register = get_system_register()
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"' .. system_register .. 'y')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"' .. system_register .. 'Y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"' .. system_register .. 'p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"' .. system_register .. 'P')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"' .. system_register .. 'd')
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"' .. system_register .. 'D')
