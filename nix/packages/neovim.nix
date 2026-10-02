{ pkgs }:

with pkgs; [
  neovim

  cargo
  gcc
  ripgrep

  bash-language-server
  copilot-language-server
  gopls
  vscode-json-languageserver
  lua-language-server
  prettier
  # qmlls
  ruff
  shellcheck
  stylua
  terraform-ls
  tflint
  ty
  yaml-language-server
]
