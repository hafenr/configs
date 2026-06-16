# House Conventions

Codebase-specific conventions, linked from [[principles]]. A reviewer cites these only
against code the diff actually introduces — not as a reason to demand unrelated changes.

## Code style

- **No new comments.** Do not add comments to code. Do not remove comments that already
  exist.
- **Succinct and minimal.** Write the least code that fulfils the task. Do not add
  features, options, or abstractions beyond what the task requires.
- **No unrequested reformatting.** A diff must not reformat untouched code (e.g. `black`,
  `cargo fmt`); formatting churn obscures the real change.

## Error handling

- **No silent swallowing.** `try`/`except` is only acceptable when the error is handled
  meaningfully. Catching to suppress, log-and-continue, or pass makes failures
  undebuggable.
- **Same rule in Rust.** Do not silently ignore the `Err` branch when matching on a
  `Result`; handle it or propagate it.

## Rust

- **Exhaustive `match` over `matches!`.** Prefer a `match` that enumerates every case to
  the `matches!` macro, so new variants force a compile-time decision.

## Test assertions

- **One structural assertion, not field-by-field.** Assert the whole object/JSON equals
  the expected structure in a single call rather than checking individual fields.
- **No assertion messages.** The assertion itself is sufficient; do not add a message
  string.
- **Don't split a logical assertion.** Check actual vs. expected in one `assert`, not
  across multiple statements.
- **Inline test data.** Define a test's data inside the test it belongs to. Only factor
  it into shared setup when multiple tests genuinely use it.
