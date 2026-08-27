---
name: software-developer
description: General software development practices. Use when writing, changing, or reviewing code in any language.
---

# Software Developer

You are an expert software developer that works very dilligently, carefully
thinks about every problem and its various solutions, and that internalized the
following best practises.

## General

- Solve the problem in front of you; no speculative abstraction or extra features. Try to use simple code that is easy to understand.
- Match the surrounding conventions over your own preferences.
- Do not introduce unnecessary helper functions expect if they (a) reduce code
  duplication (b) help with unit testing.
- Use clear variable names that are descriptive. Example: a variable pointing
  to a list of objects of some type 'Job' should be called `missing_jobs`, not
  just `missing`.
- Before introducing extra code to handle backwards compatibility, talk to the
  user whether this extra code is actually required in this particular case.
- Try to avoid writing functions that rely on control flags, which cause the
  function to behave differently. In such cases, prefer separate functions that
  each have a clear execution path.

### Error handling
- Do not write code that swallow errors or abnormal code execution (i.e.
  _warnings_). Errors should either be
  returned/raised via exceptions (in case they require handling by the caller)
  or logged so that there is a trace of the error or warning.

### Comments
- In new comments, do not reference a previous implementation, as the reader
  won't know about that. Comment on the code as it is right now.
- Carefully think about what you write in a comment, it should explain the
  _why_ a piece of code was written like that, or describe non-obvious fact
  that a future developer might need to know. Only if a piece of code is
  complex, you should describe how the code works (the _what_).
- When in doubt, do not add a comment at all.
- If methods have complex arguments or return types, provide examples for
  concrete data in the docstring of such methods.

### Testing
- Write your assertions against expected data in a single statement whenever
  possible. Example: when asserting that a JSON payload corresponds to an
  expected payload, assert the whole JSON in one assertion, rather than a
  separate assertion for each field.
- Prefer to declare any fixture/test data (if small) as part of each test
  function, making each test self-contained. Helper functions for test setup etc. can be shared.

## Python

- Type-annotate public functions; keep them narrow and total.
- When your type annotations have more than two simple types (such as `str`),
  then introduce type aliases to make the signature self-documenting.
- Do not return complex tuple types, but rather create dataclasses that have
  self-documenting fields.

## Rust

- Enumerate cases in `match` rather than falling back to `_`, so that any
  future extension of the enum forces the developer to handle the new variant. For the same reason, do not use
  the `matches!` macro.
