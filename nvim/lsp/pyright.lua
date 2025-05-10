return {
  cmd = {"pyright-langserver", "--stdio"},
  filetype = {"python"},
  root_markers = {
    "pyproject.toml",
    "requirements.txt",
  },
  settings = {
    textDocument = {
      publishDiagnostics = {
        virtual_text = true,
      },
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
