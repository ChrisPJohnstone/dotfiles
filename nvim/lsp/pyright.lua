return {
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  root_markers = {
    "pyproject.toml",
    "requirements.txt",
  },
  settings = {
    python = {
      textDocument = {
        publishDiagnostics = {
          virtual_text = true,
        },
      },
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
-- Dependencies `pyright`
