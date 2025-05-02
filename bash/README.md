# Overview

Bash is my shell scripting language of choice. Most linux machines and WSL use bash so it seemed easier to go with this and change Mac's than go with zsh and change everything else.

# Usage

- `$BROWSER` is set to firefox
- `$EDITOR` is set to nvim
- Editing is in vi mode.
- You can press `Ctrl + e` to open the current command in `$EDITOR` and the command will be executed when you close
- Tab completions are case insensitive.
- `ls` & `grep` are aliased to have a coloured output
- `tcd` is aliased to a tmux script I use for sessionising different projects
- Prompt is set to `[pwd] [git branch] [venv name]`
    - `[pwd]` only displays bottom level so `/home/user/.config` would display `[.config]`
    - `[git branch]` & `[venv name]` are only included if applicable so prompt would simply be `[pwd]` while not in a repo/venv
    - Prompt has inverted colours as opposed to rest of terminal (background is font colour & font colour is background colour)
- `less` (the tool used by `git diff` & `man`) is configured to have
    - Case insensitive searching
    - Search matches will be in the centre of the screen
    - Auto quit if the output is <= one screen (effectively `cat`)
- History is set to
    - Keep 10000 records
    - Keep history in `$HOME/.histfile`
    - Ignore duplicates
- `rsm` will run an aws stepfunctions state machine and follow the run using aws cli
- `cdk` has limited tab completion (I only have the commands I use frequently as more options means more tabs)

# Links

- [Bash vi mode](https://www.gnu.org/software/bash/manual/html_node/Readline-vi-Mode.html)
- [less](https://www.greenwoodsoftware.com/less/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [aws stepfunctions](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [aws cli](https://aws.amazon.com/cli/)
- [aws cdk](https://docs.aws.amazon.com/cdk/v2/guide/home.html)
