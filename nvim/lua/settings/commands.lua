-- Add diff files to quickfix list
vim.api.nvim_create_user_command("Diff", function(opts)
  local branch = opts.args ~= '' and opts.args or 'develop'
  local files = vim.fn.systemlist("git diff --name-only " .. branch)
  local qf_list = {}
  for _, file in ipairs(files) do
    table.insert(qf_list, { filename = file, lnum = 1, text = 'M' })
  end
  vim.fn.setqflist(qf_list, 'r')
  vim.cmd.copen()
  vim.cmd.cfirst()
end, { nargs = '?' })
