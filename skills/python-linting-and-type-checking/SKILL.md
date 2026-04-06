---
name: python-linting-and-type-checking
description: Use ruff and ty for linting and type checking.
---

# Linting and Type Checking in Python

Use **ruff** and **ty** (Astral). Prefer `uv run --dev` after adding them with `uv add --dev ruff ty`. `uvx ty check .` works without project deps but can be slower.

- [ruff](https://docs.astral.sh/ruff/)
- [ty](https://docs.astral.sh/ty/)

```bash
uv run --dev ruff check .
uv run --dev ty check .
```

## When to ignore instead of “fixing” third-party typing

Some libraries ship typing that is wrong or impractical to satisfy; ignoring is often simpler than contorting application code for issues that never surface at runtime.

Examples that have come up:

```python
# fastapi — holding a reference to the DI container on the app
fast_api.container = container  # type: ignore

# mlflow, ddtrace — spurious possibly-missing-import
from mlflow.something import stuff  # ty: ignore [possibly-missing-import]
from ddtrace import tracer  # ty: ignore [possibly-missing-import]

# pydantic — dynamic construction from JSON/dicts
return Config(**data)  # ty: ignore [missing-argument]

# protobuf — generated stubs are weakly typed
real_venue = venue_pb2.Venue()  # ty: ignore [unresolved-attribute]
```

Add new ignores only with a short comment explaining the library/quirk.
