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
- `<leader>ff` will open treesitter find files
- `<leader>fg` will open treesitter live grep
- `<leader>fb` will open treesitter buffer search
- `<leader>fh` will open treesitter help tags

Python only
- `<leader>t` will save the current file and feed it to `pytest`
- `<leader>b` debugger set a breakpoint
- `<leader><F1>` debugger start/continue
- `<leader><F2>` debugger step into
- `<leader><F3>` debugger step over
- `<leader><F4>` debugger step out
- `<leader><F13>` debugger restart

# Links

- [neovim](https://neovim.io/)
- [catppuccin](https://github.com/catppuccin/nvim) Colour scheme
- [colorizer](https://github.com/norcalli/nvim-colorizer.lua) Highlights colour words, rgb values & hex codes their colour
- [commentary](https://github.com/tpope/vim-commentary) Enables `gc` for commenting code
- [copilot](https://github.com/github/copilot.vim) AI code assistant
- [dap-python](https://github.com/mfussenegger/nvim-dap-python) Python debugger
- [dap-ui](https://github.com/rcarriga/nvim-dap-ui) Debugger ui
- [dap](https://github.com/mfussenegger/nvim-dap) Debugger protocol
- [fugitive](https://github.com/tpope/vim-fugitive) Git client
- [lsp-config](https://github.com/neovim/nvim-lspconfig) LSP config
- [mason](https://github.com/williamboman/mason.nvim) Third party package manager
- [oil](https://github.com/stevearc/oil.nvim) netrw replacement
- [repeat](https://github.com/tpope/vim-repeat) Enables repeating plugin actions with `.`
- [surround](https://github.com/tpope/vim-surround) Encasing editing (e.g. change "test" to 'test' with a `cs"'`)
- [telescope](https://github.com/nvim-telescope/telescope.nvim) Fuzzy finder
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Treesitter for nvim
