# Overview

This repository contains my dotfiles for various applications and tools that I use across different operating systems. The goal is to provide a consistent and efficient development environment, regardless of the platform.

# Setup/Usage

- Each tool has a `install` script which will put the config where it needs to be for usage. Note that this will override any existing files.
- The `install_all` script will run the `{tool}/install` for all tools relevant to your OS.
- Each tool has a `README.md` which will tell you more about what it does and how to use it

# Tool Overview

This section provides a brief overview of the tools and applications I use, categorized by operating system.

## Shared

Tools that I use across all operating systems.
- [bash](https://www.gnu.org/software/bash/) Shell
- [firefox](https://www.firefox.com/en-US/) Web Browser
- [git](https://git-scm.com/) Version Control System
    - [git-delta](https://github.com/dandavison/delta) Syntax highlighting pager for git and diff output
- [kitty](https://sw.kovidgoyal.net/kitty/) Terminal Emulator
- [nano](https://www.nano-editor.org/) Text editor
- [nvim](https://neovim.io/) Primary text editor
- [ripgrep](https://github.com/BurntSushi/ripgrep) Much faster grep
- [tmux](https://github.com/tmux/tmux) Terminal multiplexer
- [vim](https://www.vim.org/) Text editor

## MacOS

Tools that I use on macOS.
- [claude](https://claude.com/product/claude-code) Coding Assistant
- [skhd](https://github.com/koekeishiya/skhd) Keyboard shortcut daemon for macOS

## Linux

Tools that I use on Linux.
- [calcurse](https://www.calcurse.org/) Text based calender and scheduling app
- [gammastep](https://gitlab.com/chinstrap/gammastep) Screen color temperature controller
- [grim](https://github.com/emersion/grim) Screenshot Utility for Wayland
- [gtk-3.0](https://docs.gtk.org/gtk3/) GUI toolkit for Linux applications
- [hyprland](https://hyprland.org/) Dynamic tiling window manager
    - [hyprlock](https://github.com/hyprwm/hyprlock/) Lockscreen Utility for hyprland
    - [hyprpaper](https://github.com/hyprwm/hyprpaper) Wallpaper Utility for hyprland
- [mako](https://github.com/emersion/mako) Notification daemon
- [nemo](https://github.com/linuxmint/nemo) Graphical file browser
- [pavucontrol](https://github.com/pulseaudio/pavucontrol) Graphical Sound Controller
- [rofi](https://github.com/davatorium/rofi) Application launcher
- [slurp](https://github.com/emersion/slurp) Screen region selector for Wayland
- [waybar](https://github.com/Alexays/Waybar) Status bar for Wayland
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) Clipboard utility for Wayland
