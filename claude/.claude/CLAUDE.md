## General instructions
- Do not add any comments when writing code. Do not remove existing comments.
- Try to write succint code. Do not add any features that are not necessary to fulfill the task at hand.
- When being asked to run python tests, run the tests using `poetry run pytest` instead of calling python directly.
- When being asked to run tests for the decentriq_platform python package, you need to enter a poetry shell in decentriq_platform_tests and then source environment variables for connecting to the test environment by sourcing for example /Users/rhafen/dq/scripts/config-staging.sh. Afterwards the tests can be run using pytest.
- When writing assertions to not assert that individual fields in a JSON or object are correct, but rather check that the whole object or JSON corresponds to the expected structure in a single assertion call.
- When writing assertions in tests, do not add an additional message string, the assertion itself is enough.
- When writing assertions in tests, do not split a single logical assertion
  across multiple assert statements but use a single assert that checks the
  actual vs. the expected value in one go.
- Always prefer to use match statements that enumerate all the cases in Rust, rather than relying on matches! macros.
- Do not just ignore tests that are failing, even if you think they don't have anything to do with what you did. Stop and ask.
- Prefer to create variables for tests within the test itself to which they belong, instead of having separate setup functions. Only do this if multiple tests share them.
- When DATABASE_URL is not set for a test, you can set it with: DATABASE_URL=postgres://postgres:password@localhost:5432/api_platform
- Do not format files using e.g. black or cargo fmt without being asked.
- When being asked to sync dqdmp, run the script ./build-and-push-to-databricks.sh and update the pipeline_job.ipynb worksheet so it references the new wheels.
- Do not add try/except wrappers in a way that would just silently drop errors, which would make everything harder to debug. Try/except should only be used if we handle the errors in a meaningful way. Similarly in Rust, do not silently ignore branches that match on Err when matching on a Result value.
- When you talk to the user, always try to be as brief as possible, without
  witholding important information.
- When you are asked about questions related to best practises or on how to do
  certain things, do a web research so we get the most up to date and accurate
  information.
