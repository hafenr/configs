# Engineering Principles

Principles that govern review judgments. Reviewers cite these by name. They are a
frame, not a checklist — a finding only counts if it shows the work fails to achieve
its stated intent.

## Correctness & data integrity

- **Idempotency.** Re-running a job for the same input must produce the same result.
  Prefer UPSERT/MERGE over blind INSERT, dedupe on a stable event key, and make each
  partition independent so it can be reprocessed in isolation.
- **Parameterized time.** Never hardcode `now()` / `today()` in pipeline logic. The
  execution/partition date is an input, so the same code backfills history correctly.
- **Validate at every stage.** Check schema, nullability, and ranges on the way in and
  on the way out. Fail loud and early; never let a silent type coercion propagate.
- **Schema evolution is expected, not exceptional.** Assume upstream fields change type,
  appear, or vanish. Pin/validate the contract; don't `SELECT *` into downstream logic.

## Failure & operability

- **Retry-safe by construction.** Transient failures get retries with exponential
  backoff; retries are only safe because operations are idempotent (see above).
- **Contain blast radius.** Use timeouts, circuit breakers, and bounded concurrency so a
  slow or failing dependency degrades one path instead of cascading.
- **Observable by default.** Emit structured logs, metrics, and lineage for every stage.
  If you can't answer "did the data land, and is it correct?" from telemetry, it's not
  done.
- **No silent skips.** A missing input, empty partition, or dropped record is surfaced
  and counted, never quietly swallowed.

## Design & simplicity

- **Understand the mechanism before adding complexity.** Justify each layer of
  abstraction, framework, or caching by the concrete problem it removes. Default to the
  simplest thing that meets the intent.
- **Measure, don't guess.** Performance and resource claims (partitioning, joins, OOM,
  shuffle) must be backed by a measurement, not intuition. For Spark-specific review
  judgments, see [[spark]].
- **Boring is a feature.** Prefer well-trodden patterns over clever ones; optimize for the
  next engineer reading this at 3 a.m.

## Security & data boundaries

- **Least privilege.** Scope credentials, IAM roles, and bucket/table access to the
  minimum the job needs; no shared god-tokens.
- **Respect the trust boundary.** Sensitive data stays inside its enclave/clean-room
  perimeter. Never log secrets or raw PII, and never widen access for convenience.
- **Inputs are hostile until validated.** Treat external data and API responses as
  untrusted; sanitize and bound them before use.

## Testing

- **Test the unhappy path.** Cover empty datasets, malformed rows, boundary values, and
  duplicate delivery — not just the happy case.
- **Pipeline code is application code.** It gets version control, review, and tests like
  any other production system.
For this codebase's house conventions on code style, error handling, and test
assertions, see [[conventions]].
