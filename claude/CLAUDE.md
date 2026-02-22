# Global Claude Instructions

## Behaviour Rules

- **Never commit** without explicit user instruction — not even "obvious" or "small" changes
- Only change what was asked; don't refactor surrounding code, add docstrings, or clean up unrelated things
- Don't add comments unless the logic is genuinely non-obvious
- Don't add error handling for scenarios that can't realistically happen
- Prefer editing existing files over creating new ones

## Fail Fast

Prefer detecting and surfacing errors early rather than working around them.

- **Guard clauses** — raise immediately on bad input rather than nesting the happy path; avoid deeply nested code (max 2-3 levels):
  ```python
  # good
  def process(user):
      if not user.is_active:
          raise ValueError(f"User {user.id} is not active")
      ...

  # bad
  def process(user):
      if user.is_active:
          ...
  ```
- **Prefer logical checks over `try...except`** — check for conditions rather than catching exceptions:
  ```python
  # good
  if "key" in d:
      value = d["key"]

  # bad
  try:
      value = d["key"]
  except KeyError:
      ...
  ```
- **Don't use silent fallbacks** that hide missing data:
  ```python
  # good
  value = d["key"]  # raises KeyError if missing — intentional

  # bad
  value = d.get("key", None)  # silently returns None, problem propagates
  ```
- **Don't catch-and-continue** — let exceptions propagate:
  ```python
  # good
  result = fetch_data()

  # bad
  try:
      result = fetch_data()
  except Exception:
      result = None
  ```

## Code Style

- Prefer explicit over implicit; avoid overly clever one-liners
- Prefer iteration over recursion
- Prefer composition over inheritance
- Multi-line function calls must use `arg_name=value` syntax with one argument per line:
  ```python
  # good
  result = my_function(
      first_arg=value1,
      second_arg=value2,
      third_arg=value3,
  )

  # bad
  result = my_function(value1,
                       value2, value3)
  ```

## Naming

- Boolean variables and functions should read as questions: `is_active`, `has_permission`, `can_proceed`
- Avoid abbreviations in names — `user_count` not `usr_cnt`
- Related variables should share a prefix, not a suffix:
  ```python
  # good
  PATH_CONFIG = ...
  PATH_OUTPUT = ...

  # bad
  CONFIG_PATH = ...
  OUTPUT_PATH = ...
  ```
