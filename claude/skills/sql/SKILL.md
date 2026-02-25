---
name: sql
description: SQL conventions, style, and best practices for AWS Athena (HiveSQL DDL, Presto DML). Use when working on SQL queries, DDL, or data pipelines targeting Athena.
---

## Dialect Context

- **DDL** (CREATE TABLE, ALTER TABLE, etc.) — HiveSQL syntax
- **DML** (SELECT, INSERT, CTAS, etc.) — Presto SQL syntax
- Athena bills per data scanned — performance and partitioning are correctness concerns, not optimisations

## Query Style

- SQL keywords in `UPPERCASE`: `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`, `LEFT JOIN`, etc.
- Left-align keywords; indent column lists with 4 spaces:
  ```sql
  SELECT
      "events"."user_id",
      "events"."event_type",
      COUNT(*) AS "event_count"
  FROM "schema"."events"
  WHERE "events"."event_date" >= DATE '2024-01-01'
  GROUP BY 1, 2
  ORDER BY 3 DESC
  ```
- Single `WHERE` conditions stay on the same line; multiple conditions each get their own line with the first double-indented; `AND`/`OR` at single indent (4 spaces), with `OR` followed by two spaces to align with `AND `:
  ```sql
  -- single condition
  WHERE "orders"."status" = 'active'

  -- multiple conditions
  WHERE
          "events"."status" = 'active'
      AND "events"."created_at" >= DATE '2024-01-01'
      OR  "events"."status" = 'pending'
  ```
- `GROUP BY` and `ORDER BY` use column indices, not names
- Prefer CTEs over nested subqueries for readability — name them with `snake_case` nouns
- For multiple CTEs, place the comma after the closing bracket with the next CTE name on a new line:
  ```sql
  WITH "active_users" AS (
      SELECT
          "users"."user_id",
          "users"."email"
      FROM "schema"."users"
      WHERE "users"."is_active" = true
  ),
  "recent_orders" AS (
      SELECT
          "orders"."user_id",
          COUNT(*) AS "order_count"
      FROM "schema"."orders"
      WHERE "orders"."order_date" >= DATE '2024-01-01'
      GROUP BY 1
  )

  SELECT
      "active_users"."email",
      "recent_orders"."order_count"
  FROM "active_users"
  LEFT JOIN "recent_orders"
      ON  "active_users"."user_id" = "recent_orders"."user_id"
  ```
- Always use explicit `AS` for aliases — never implicit
- Never use `SELECT *` in production queries — always name columns explicitly
- Use trailing commas in column lists to make diffs cleaner
- Prefer `CASE` statements over complex `OR` logic:
  ```sql
  -- good
  CASE
      WHEN "orders"."status" = 'complete' AND "orders"."is_paid" THEN TRUE
      WHEN "orders"."status" = 'pending' AND "orders"."has_invoice" THEN TRUE
      ELSE FALSE
  END

  -- bad
  ("orders"."status" = 'complete' AND "orders"."is_paid")
      OR ("orders"."status" = 'pending' AND "orders"."has_invoice")
  ```
- Always use fully qualified names — backticks in DDL, double quotes in DML:
  ```sql
  -- DDL (HiveSQL)
  CREATE EXTERNAL TABLE `schema`.`events` (
      `event_id`   STRING,
      `event_type` STRING
  )

  -- DML (Presto)
  SELECT
      "events"."user_id",
      "events"."event_type"
  FROM "schema"."events"
  ```

## Joins

- Always use explicit JOIN types — never implicit comma joins
- Prefer `LEFT JOIN` over `RIGHT JOIN` — restructure the query instead
- Always place `ON` conditions on a new line, indented, with two spaces after `ON` to align with `AND`:
  ```sql
  LEFT JOIN "schema"."users"
      ON  "orders"."user_id" = "users"."user_id"

  LEFT JOIN "schema"."users"
      ON  "orders"."user_id" = "users"."user_id"
      AND "users"."is_active" = true
  ```

## NULL Handling

- Always use `IS NULL` / `IS NOT NULL` — never `= NULL` or `!= NULL`:
  ```sql
  -- good
  WHERE "orders"."deleted_at" IS NULL

  -- bad
  WHERE "orders"."deleted_at" = NULL
  ```
- Be aware that `NULL` values are excluded from aggregations (`COUNT`, `SUM`, etc.) — use `COUNT(*)` to count all rows including NULLs
- `NULL` comparisons in `WHERE` always evaluate to `UNKNOWN`, not `TRUE` or `FALSE` — filter explicitly if NULLs need to be included:
  ```sql
  WHERE
          CASE
              WHEN "orders"."status" = 'active' THEN TRUE
              WHEN "orders"."status" IS NULL THEN TRUE
              ELSE FALSE
          END
  ```

## Performance

- **Always filter on partition columns** — queries without a partition filter scan the full table and are both slow and expensive:
  ```sql
  -- good
  SELECT "events"."user_id" FROM "schema"."events" WHERE "events"."event_date" = DATE '2024-06-01';

  -- bad: full table scan
  SELECT "events"."user_id" FROM "schema"."events" WHERE YEAR("events"."created_at") = 2024;
  ```
- Prefer `REGEXP_LIKE` over `LIKE` for pattern matching:
  ```sql
  -- good
  WHERE REGEXP_LIKE("events"."field", 'test')

  -- bad
  WHERE "events"."field" LIKE '%test%'
  ```
- Use `IN` lists rather than `OR` chains for the same column:
  ```sql
  -- good
  WHERE "orders"."status" IN ('complete', 'pending', 'refunded')

  -- bad
  WHERE
          "orders"."status" = 'complete'
      OR  "orders"."status" = 'pending'
      OR  "orders"."status" = 'refunded'
  ```
- Push filters as early as possible — filter inside CTEs rather than in the outer query
- Avoid `DISTINCT` unless genuinely needed; prefer `GROUP BY` when aggregation is the goal
- For large joins, put the larger table on the left (Presto broadcast joins put the right-hand table in memory)
