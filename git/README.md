# Overview

Git is a version control system. I have some settings & aliases to make my life easier

# Usage

- Default branch in a new repo will be `main`
- When you `git push` it will create a branch of the same name if one doesn't already exist in your remote (unless specfied otherwise)
- When you `git pull` it will rebase by default
- `git edit` will open all the files which have been changed locally in your `$EDITOR` for vim/nvim you can add -O or -p to open these files in panes or tabs respectively
- `git update` will update your `develop` branch and merge it in to current branch
- `git open` will open your current repo in a browser at current hash. You can provide a filepath as an arg to open that specific file.

# Links

- [git](https://git-scm.com/) Version Control System
