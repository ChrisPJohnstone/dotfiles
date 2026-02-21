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
  "bash",
  "c",
  "copilot",
  "json",
  "lua",
  "py_lint",
  "py_type",
  -- "terraform",
  "tf_lint",
  "yaml",
})

-- LSP augroup
local lsp_augroup = vim.api.nvim_create_augroup("LSP", {})

function LSPFormatOnSave(client, buf)
  if not client:supports_method("textDocument/formatting") then return end
  if client:supports_method("textDocument/willSaveWaitUntil") then return end
  if client.name == "py_lint" then return end -- Skip ruff formatting
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_augroup,
    buffer = buf,
    callback = function()
      vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
    end,
  })
end

function LSPCompletion(client, buf)
  if not client:supports_method("textDocument/completion") then return end
  vim.opt.completeopt = {
    "menu",
    "menuone",
    "noinsert",
    "noselect",
    "fuzzy",
    "popup",
  }
  vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
end

function LSPInLineCompletion(client, buf)
  if not client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, buf) then
    return
  end
  vim.lsp.inline_completion.enable(true, { bufnr = buf })
  vim.keymap.set(
    'i',
    '<C-F>',
    vim.lsp.inline_completion.get,
    { desc = 'LSP: accept inline completion', buffer = buf }
  )
  vim.keymap.set(
    'i',
    '<C-G>',
    vim.lsp.inline_completion.select,
    { desc = 'LSP: switch inline completion', buffer = buf }
  )
end

function LSPDocumentHighlight(client, buf)
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
  if not supports_highlight then return end
  vim.lsp.buf.clear_references()
  vim.lsp.buf.document_highlight()
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_augroup,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf
    LSPFormatOnSave(client, buf)
    LSPCompletion(client, buf)
    LSPInLineCompletion(client, buf)
  end
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
    if not supports_highlight then return end
    vim.lsp.buf.clear_references()
    vim.lsp.buf.document_highlight()
  end
})
