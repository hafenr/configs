# Agent instructions

## General instructions
- Do not format files using e.g. black or cargo fmt without being asked.
- When being asked to sync dqdmp, run `dmp/deploy-dev.sh` (the DAB builds and uploads the dqdmp + native wheels; the old build-and-push-to-databricks.sh was removed).
- Do not add try/except wrappers in a way that would just silently drop errors, which would make everything harder to debug. Try/except should only be used if we handle the errors in a meaningful way. Similarly in Rust, do not silently ignore branches that match on Err when matching on a Result value.
- When you talk to the user, always try to be as brief as possible, without
  witholding important information.
- When you are asked about questions related to best practises or on how to do
  certain things, do a web research so we get the most up to date and accurate
  information.
- If you come across bugs, missing features, confusing structure, or workflow
  oddities outside the current task, add a concise note to `SESSION.md` — it
  is not a progress log; do not record accomplishments there. Never commit this
  file to Git.

## Version control
- Do not force push!

## Writing and executing tests
- When being asked to run python tests, run the tests using `poetry run pytest` instead of calling python directly.
- When being asked to run tests for the decentriq_platform python package, you need to enter a poetry shell in decentriq_platform_tests and then source environment variables for connecting to the test environment by sourcing for example /Users/rhafen/dq/scripts/config-staging.sh. Afterwards the tests can be run using pytest.
- When writing assertions to not assert that individual fields in a JSON or object are correct, but rather check that the whole object or JSON corresponds to the expected structure in a single assertion call.
- When writing assertions in tests, do not add an additional message string, the assertion itself is enough.
- When writing assertions in tests, do not split a single logical assertion
  across multiple assert statements but use a single assert that checks the
  actual vs. the expected value in one go.
- Do not just ignore tests that are failing, even if you think they don't have anything to do with what you did. Stop and ask.
- Prefer to create variables for tests within the test itself to which they belong, instead of having separate setup functions. Only do this if multiple tests share them.
- When DATABASE_URL is not set for a test, you can set it with: DATABASE_URL=postgres://postgres:password@localhost:5432/api_platform

## Interacting with infrastructure
- Never probe an ssh port to check whether a host is reachable (e.g. `nc -z host 22`).
  Each probe is a connection closed before authentication, which OpenSSH's
  PerSourcePenalties (on by default since 9.8) and fail2ban/sshguard jails both count
  as abuse — the source IP then gets its SYNs dropped for up to ~10 minutes, so a
  polling loop keeps extending the block it is waiting on. The host still answers
  ping while this happens, which makes it look like a network problem. Instead:
  reuse a single connection for all commands
  (`-o ControlMaster=auto -o ControlPath=/tmp/cc-<host>.sock -o ControlPersist=30m
  -o ServerAliveInterval=15`), run anything long detached on the host
  (`setsid nohup … > ~/log 2>&1 </dev/null`, guarded by `flock -n`), and poll by
  re-running one short authenticated ssh command no more than once a minute. If
  already blocked, wait it out without touching port 22 at all.
- A failed ssh authentication earns the same penalty as a port probe, so never
  ssh somewhere just to find out whether a login works — that is what a probe
  is. Read the config to learn which user has access (for deploy-rs,
  `profiles.<name>.user` plus any `sshUser`), and pass the user you already know
  is authorized. Symptom of an active block:
  `kex_exchange_identification: read: Operation timed out` while the host still
  answers ping.
- Set `ControlPersist` longer than the whole task (e.g. `4h`). When a shorter
  persist expires mid-task, the next command silently opens a fresh TCP
  connection, which is exactly the reconnect a block drops — and a detached
  poll loop then keeps retrying it. Verify the master with `ssh -O check`
  (a local socket operation, no network) before assuming a connection is warm.

## Writing code
- Always prefer to use match statements that enumerate all the cases in Rust, rather than relying on matches! macros.
- Try to write succint code. Do not add any features that are not necessary to fulfill the task at hand.
- Prefer a well-established external dependency over hand-writing non-trivial
  functionality, whenever the language has a package manager: pick the most
  widely used, actively maintained library for the job. Never hand-roll solved
  problems like crypto, standard-format parsing, or date/time handling.
- Treat your knowledge of libraries, frameworks, tools, and platform
  ecosystems as potentially stale. Before writing against one or advising on
  it, verify against the authoritative source rather than memory: for a
  project dependency, the installed version and its docs; for hosted platforms
  and services (cloud providers, SaaS APIs), the vendor's current
  documentation, since they change independently of any local code.
- When changing an API, update all call sites and delete the old path. No
  compatibility wrappers, re-exports, or deprecated aliases unless the code
  has real external consumers.
- Let errors propagate. Don't add fallback values, catch-and-continue, or
  `unwrap_or_default()`-style recovery that masks a failure the caller should
  see.

## Writing comments
- Default to no comment. Write one only when it says something the code
  cannot: a constraint, an invariant, a non-obvious why.
- Write comments for the future reader of the file, never for the reviewer of
  the current change. If a comment references the task, the conversation, what
  the code used to do, or why the change is correct ("as requested", "now
  handles X", "changed from Y"), delete it.

## Dotfiles (chezmoi)
- The dotfiles in `$HOME` are chezmoi-managed copies, not the source of truth.
  The source is the `~/configs` repo (`chezmoi source-path`), where e.g.
  `~/.tmux.conf` comes from `dot_tmux.conf.tmpl`. Always edit the source file
  and then run `chezmoi apply`; never edit the copy in `$HOME` directly, as the
  next apply overwrites it.
- Run `chezmoi status` (or `chezmoi diff <target>`) before applying. Drift goes
  in both directions: the source may hold edits that were never applied, and
  `$HOME` may hold edits that were never captured, so a blind `chezmoi apply`
  can silently destroy work.
- To pull an existing `$HOME` edit back into the source, use `chezmoi re-add`.
  It refuses to overwrite templates and reports success while doing nothing, so
  for any `.tmpl` source the change has to be made by hand. Verify with
  `chezmoi diff` afterwards.

## Working with the delta repository
- api-platform: call generate_schema.sh in api-platform after doing any changes that might
  change the graphql schema
