# Spark Principles

Spark-specific review judgments, linked from [[principles]]. These extend
**Measure, don't guess** — a Spark finding only holds if the Spark UI, an `explain`
plan, or partition stats back it up.

## Partitioning

- **Right-size partitions.** Target 128–256 MB per partition. Too few starves
  parallelism and pressures memory; too many drowns the job in task-scheduling
  overhead.
- **Coalesce to shrink, repartition to rebalance.** Reducing partition count uses
  `coalesce` (no shuffle); only use `repartition` when you actually need an even
  redistribution or a new partition key.
- **Partition on read and write deliberately.** Lean on predicate pushdown and column
  pruning so only the needed data is read; partition output by the columns future
  queries filter on.

## Shuffle

- **Shuffle is the default suspect for slowness.** Minimize wide transformations;
  pre-aggregate locally before a global aggregation so less data crosses the network.
- **Don't pay for exactness you don't need.** Avoid `distinct().count()` patterns where
  an approximate count (`approx_count_distinct`) or an existence check (`take(1)` /
  `isEmpty()` instead of `count()`) is sufficient.

## Joins

- **Broadcast small sides.** When one side fits under the broadcast threshold (~10 MB,
  configurable), broadcast it to skip the shuffle. Verify the plan actually chose a
  broadcast join.
- **Skew dominates job time — handle it explicitly.** Enable AQE skew-join handling;
  for severe key skew, salt the hot keys. A single straggler task is the signal.

## Memory & caching

- **Cache only what is reused, and unpersist it.** Caching a DataFrame read once wastes
  memory that execution needs. `MEMORY_AND_DISK` is the safe default.
- **Break long lineage with checkpoints.** Deep chains (e.g. large union/join trees)
  inflate the plan and risk OOM; checkpoint to materialize and cut lineage.
- **Account for non-JVM memory.** Set `memoryOverhead` for Python/Arrow/off-heap usage;
  OOM kills here look like mysterious executor losses.

## Correctness & simplicity

- **Prefer built-ins over UDFs.** Native expressions stay in the optimized/codegen path;
  a Python UDF breaks it and serializes row-by-row. Reach for a UDF only when no
  built-in exists.
- **Never collect large data to the driver.** Keep work distributed; `collect()` on a
  big result is an OOM and an anti-pattern.
- **Enable AQE.** Adaptive query execution fixes many partition-count and skew problems
  at runtime — but it is a safety net, not a substitute for the judgments above.
