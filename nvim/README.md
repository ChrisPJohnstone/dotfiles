# Overview

Neovim is a text editor

# Navigation

- `lua`
    - `config` Configurations & settings
    - `plugins` Plugins which are installed & their settings
- `after/ftplugin` has settings which are specific to file type

# Usage

There's far too many settings & preferences to cover here so I'm just gonna cover setup and the custom bindings. If you want to deep dive settings you'll have to go through the configs yourself

## Setup

- Run `:Lazy` to install/update plugins
- Run `:Mason` to install external dependencies

## Custom Bindings

- Leader key is bound to " "
- `<C-W>n` is rebound to new *vertical* split rather than horizontal
- `<C-W><C-?>` (? being one of hjkl) will resize panes
- `<leader>d` will open the directory of the current file
- `<leader>s` will save the current file
- `<leader>ff` will open telescope find files
- `<leader>fg` will open telescope live grep
- `<leader>fb` will open telescope buffer search
- `<leader>fh` will open telescope help tags

# Links

- [neovim](https://neovim.io/)
- [copilot](https://github.com/github/copilot.vim) AI code assistant
- [fugitive](https://github.com/tpope/vim-fugitive) Git client
- [mason](https://github.com/williamboman/mason.nvim) Third party package manager
- [mini-comment](https://github.com/echasnovski/mini.comment) Creates shortcuts for commenting and uncommenting code
- [mini-hipatterns](https://github.com/echasnovski/mini.hipatterns) Highlights color codes and other patterns
- [mini-surround](https://github.com/echasnovski/mini.surround) Creates shortcuts for handling surrounding characters (e.g. brackets)
- [mini-trailspace](https://github.com/echasnovski/mini.trailspace) Highlights trailing spaces
- [oil](https://github.com/stevearc/oil.nvim) netrw replacement
- [telescope](https://github.com/nvim-telescope/telescope.nvim) Fuzzy finder
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Treesitter for nvim
