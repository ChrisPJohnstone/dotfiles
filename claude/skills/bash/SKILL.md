---
name: bash
description: Bash scripting conventions, style, and best practices. Use when working on bash/shell scripts.
---

## Script Header

- Always start with `#!/usr/bin/env bash` (not `#!/bin/bash`)

## Code Style

- All scripts must pass `shellcheck` with no warnings
- Use 4-space indentation
- Keep lines under 80 characters; break long commands with `\` and indent continuations
- Always quote variable expansions: `"${var}"` not `$var`
- Use `[[ ]]` for conditionals, not `[ ]` or `test`
- Use `${ command; }` for command substitution (runs in current environment, no subshell overhead); fall back to `$(command)` only when a subshell is explicitly needed
- Use `(( ))` for arithmetic, not `expr`
- Prefer `printf` over `echo` for anything beyond simple output
- Prefer bash builtins over external utilities where equivalent
- Use here strings (`<<<`) instead of `echo | command` to avoid a subshell:
  ```bash
  grep "pattern" <<< "$var"   # good
  echo "$var" | grep "pattern"  # bad — forks a subshell
  ```
- Use parameter expansion for string operations (`${var#prefix}`, `${var%suffix}`, `${var/old/new}`) instead of forking `sed` or `cut`
- Use `==` for glob matching and `=~` for regex inside `[[ ]]`, avoiding external `grep` where possible:
  ```bash
  [[ "$var" == *.txt ]]         # glob match
  [[ "$var" =~ ^[0-9]+$ ]]      # regex match
  ```

## Functions

- Naming: `lower-kebab-case`
- Declare functions with the `function` keyword: `function some-func () {`
- Put all functions before the main script body

## Variables

- Constants and globals: `UPPER_SNAKE_CASE`
- Local variables: `lower_snake_case`
- Declare all function-scoped variables with `local`
- Use `declare` to make types explicit:
  - `declare -i` for integers
  - `declare -r` for readonly variables
  - `declare -a` for arrays

## Iterating & Arrays

- Use `while read -r` to iterate over file lines:
  ```bash
  while read -r line; do
      ...
  done < "$file"
  ```
- Use `mapfile` when you need lines as an array (random access, multiple passes):
  ```bash
  mapfile -t lines < "$file"
  ```

## Input / Arguments

- Define a `usage` function and call it on bad arguments:
  ```bash
  function usage () {
      printf "usage: %s <arg>\n" "$0" >&2
      exit 1
  }

  [[ $# -ge 1 ]] || usage
  ```
- Use `getopts` for option parsing in scripts
- Always use `read -r` to prevent backslash interpretation:
  ```bash
  read -r -p "Enter value: " value
  ```

## Exit Codes

- Always `exit`/`return` with an explicit code
- `0` for success, non-zero for failure
- Document any non-zero exit codes at the top of the script:
  ```bash
  # Exit codes:
  #   1 — invalid arguments
  #   2 — file not found
  #   3 — permission denied
  ```
