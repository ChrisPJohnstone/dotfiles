return {
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  root_markers = {
    "pyproject.toml",
    "requirements.txt",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
