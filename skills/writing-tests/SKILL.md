---
name: writing-tests
description: TDD, favor real code over mocks, given-when-then structure and naming.
---

# Tests

Tests catch bugs in **production** code. You cannot prove tests are bug-free, so keep them **obviously** correct: short, linear, easy to read.

## TDD

Use **red/green** TDD: failing test first, then implementation until it passes.

## Prefer real code over mocks

Exercise real production paths as much as possible. Mocks skip real code and miss failures at **boundaries between layers**.

- **External services** (HTTP, queues, etc.): mock or stub where needed.
- **SQL**: use a **real** local database (e.g. docker-compose), not mocks.
- **Mocks/spies**: use to force rare behavior (errors, timeouts, ordering).

## Structure and names: given–when–then

- **Name** tests like the behavior: given _context_, when _action_, then _outcome_.
- **Body** — three phases in as few lines as practical:
  1. **Arrange** — input or starting state  
  2. **Act** — call the code under test  
  3. **Assert** — expected result or side effects  

Keep setup **next to** the test so readers are not chasing distant fixtures. If a phase grows large, extract **small helpers** or factories, not opaque shared state.

## Prototype objects for heavy constructors

When types need many fields, define a **prototype** with valid defaults for everything, then override **only** what the scenario cares about so the important delta is visible.

```python
from dataclasses import replace # or any equivalent override function

USER_PROTOTYPE = User(name="Alex Person", ...)  # all required fields filled sensibly

def test_given_invalid_name_when_emoji_then_rejected():
    user = replace(USER_PROTOTYPE, name="Bo 🦡 Badger")  # Pydantic: model_copy(update={"name": ...})
    ...
```

Treat prototypes like shared test helpers (module-level or a dedicated test module).
