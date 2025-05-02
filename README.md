# Overview

This repository contains my dotfiles for various applications and tools that I use across different operating systems. The goal is to provide a consistent and efficient development environment, regardless of the platform.

# Setup/Usage

- Each tool has a `scripts/install` script which will put the config where it needs to be for usage. Note that this will override any existing files.
- The `install_all` script will run the `{tool}/scripts/install` for all tools relevant to your OS.
- Each tool has a `README.md` which will tell you more about what it does and how to use it

# Tool Overview

This section provides a brief overview of the tools and applications I use, categorized by operating system.

## Shared

Tools that I use across all operating systems.
- [alacritty](https://alacritty.org/) Terminal Emulator
- [bash](https://www.gnu.org/software/bash/) Shell
- [git](https://git-scm.com/) Version Control System
- [nvim](https://neovim.io/) Primary text editor
- [tmux](https://github.com/tmux/tmux) Terminal multiplexer
- [vim](https://www.vim.org/) Text editor

## MacOS

Tools that I use on macOS.
- [skhd](https://github.com/koekeishiya/skhd) Keyboard shortcut daemon for macOS

## Linux

Tools that I use on Linux.
- [gammastep](https://gitlab.com/chinstrap/gammastep) Screen color temperature controller
- [gtk-3.0](https://docs.gtk.org/gtk3/) GUI toolkit for Linux applications
- [hypr](https://hyprland.org/) Dynamic tiling window manager
- [mako](https://github.com/emersion/mako) Notification daemon
- [rofi](https://github.com/davatorium/rofi) Application launcher
- [waybar](https://github.com/Alexays/Waybar) Status bar for Wayland
