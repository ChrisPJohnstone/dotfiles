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

vim.diagnostic.config({virtual_text = true})
