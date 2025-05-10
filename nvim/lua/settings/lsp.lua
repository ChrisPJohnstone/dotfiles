-- Shared settings
vim.lsp.config(
  '*',
  {
		root_markers = {".git"},
		settings = {
			textDocument = {
				publishDiagnostics = {
					virtual_text = true,
				},
			},
		},
  }
)

-- Show warnings in-line
vim.diagnostic.config({virtual_text = true})
