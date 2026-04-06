---
name: python-packaging
description: Use uv for python packaging; see skill for details.
---

# Packaging in Python

For Python packaging, we should use "uv", not any other tool such as "pip", "pipenv", or "poetry".

We will use uv for dependencies, lockfile; ignore `.venv`; use `uv run` instead of activate.

- Dependencies

Dependencies in `pyproject.toml` under [project] and [dependency-groups]; Lock file `uv.lock`.

- Locking

How to lock the dependencies after changing them:
    `uv lock`
or
    `make lock` # calls uv with authentication credentials for private libraries

- Managing the virtualenv

We use uv to create and manage the local virtualenv in `.venv`. There is no need to manage the global Python interpreter.

How to create and update the virtualenv, installing all libraries:
    `uv sync`

- Running Scripts and Tools

One runs the code under uv rather than trying to "activate" the virtualenv.

How to run code in the virtualenv:
    `uv run python mycode.py arg1 arg2` # Run Python code directly
