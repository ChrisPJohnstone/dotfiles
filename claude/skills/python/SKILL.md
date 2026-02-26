---
name: python
description: |
  Python coding conventions, style, type hints, testing with pytest, and environment setup.
  Always invoke this skill for ANY task that involves Python — reading a .py file, writing or editing Python code, adding type hints, fixing ruff/black/mypy warnings, writing pytest tests, setting up a venv, or debugging Python errors. If Python code is present or mentioned at all, use this skill.

---

## Behaviour Rules

- Code must pass `ruff` and `black` before finishing a task

## Code Style

- Always use type hints on function signatures
- Follow PEP 8 conventions
- Use `is` / `is not` when comparing to `None` — never `==`
- Prefer `enumerate()` over `range(len(...))` when iterating with an index
- Avoid bare `except:` — always specify the exception type
- Prefer `pathlib.Path` over `os.path` for file operations
- Prefer f-strings over `.format()` or `%` formatting
- Prefer context managers (`with`) for any resource requiring cleanup (files, connections, locks)
- Avoid mutable default arguments — use `None` and assign inside the function
- Use `TypedDict` or dataclasses for structured data instead of raw dicts
- When a function call has conditionally different arguments, build up a `TypedDict` and unpack it:
  ```python
  # good
  class FetchOptions(TypedDict, total=False):
      timeout: int
      retries: int

  options: FetchOptions = {"timeout": 30}
  if should_retry:
      options["retries"] = 3
  result = fetch(url, **options)

  # bad
  if should_retry:
      result = fetch(url, timeout=30, retries=3)
  else:
      result = fetch(url, timeout=30)
  ```

## Testing

- Write tests with `pytest`
- Place tests in a `tests/` subdirectory next to the module being tested
  - e.g. `src/myapp/utils/helpers.py` → `src/myapp/utils/tests/test_helpers.py`
  - Always include an empty `__init__.py` in the `tests/` subdirectory (required for pytest root directory detection)
- Test file naming: `test_<module>.py`
- Run tests after any non-trivial change to verify nothing broke

## Python Environment

- Use `pip` and `venv` for dependency management
- Create virtual environments with `python -m venv .venv`
- Install dependencies with `pip install -r requirements.txt`
- Add new dependencies to `requirements.txt` (or `requirements-dev.txt` for dev-only)

## Common Commands

```bash
# Setup
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt

# Testing
pytest
pytest -x          # stop on first failure
pytest -k "name"   # run matching tests

# Linting & formatting
ruff check .       # lint
ruff check . --fix # auto-fix lint issues
black .            # format
```
