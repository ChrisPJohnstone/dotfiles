-- Shared settings
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- Show warnings in-line
vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { current_line = true },
})

-- Enable LSPs
vim.lsp.enable({
  "bashls",
  "clangd",
  "copilot",
  "jsonls",
  "lua_ls",
  "ruff",
  "terraformls",
  "ty",
  "yamlls",
})

-- Document Highlighting
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    if vim.fn.mode() == "i" then
      vim.lsp.buf.clear_references()
      return
    end
    local supports_highlight = false
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.server_capabilities.documentHighlightProvider then
        supports_highlight = true
        break
      end
    end
    if not supports_highlight then
      return
    end
    vim.lsp.buf.clear_references()
    vim.lsp.buf.document_highlight()
  end,
})
