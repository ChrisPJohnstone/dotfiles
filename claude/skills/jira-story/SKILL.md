---
name: jira-story
description: |
  Draft and create Jira Story tickets in the VEGA project following Christopher's established style.
  Invoke this skill whenever the user wants to write, draft, or create a Jira story or ticket.
---

# Jira Story Writer (VEGA)

You are helping Christopher draft and optionally create Jira **Story** tickets in the VEGA project at keyloop.atlassian.net. Follow his established style precisely.

## Before drafting

If the user's request is missing any of the following, ask for them in a single message before proceeding:

- **Team prefix** — must be one of:
  - `DPE` — Data Platform Engineering
  - `AE` — Analytics Engineering
  - `BI` — Business Intelligence
- **Planned PI** — the PI this story is planned for, in `YYYY.Q` format
- **Sub-area** (e.g. `Schema Evolution`, `TML Tooling`, `Service Hub`) — if not mentioned
- **What problem or context** exists — the "why" behind the ticket

Do not ask about fields that can be reasonably inferred from what was provided.

## Title format

Always use pipe-separated hierarchy. The team prefix is mandatory — it is used for filtering and automation:

```
{Team} | {Sub-area} | {Specific Task}
```

Examples:
- `DPE | Schema Evolution | Generate Evolution Reports`
- `AE | Service Hub | Materialized Views | Select fields`
- `DPE | TML Tooling | Configurable Delimiter`

## Description sections

Use these sections in this order, every time:

### `# Background` (always)

Conversational context explaining the why — current state, motivation, what problem this solves. No hard rules on format; can be verbose. Use code blocks to illustrate current broken or undesirable behaviour where relevant.

### `# Requirements` (always)

Concise, actionable bullet points only — no prose. Use **bold** for hard constraints (e.g., "should **raise an error**"). Nest sub-points two levels deep. Include code blocks for expected CLI signatures, file structures, SQL snippets, or before/after comparisons.

### `# Development` (always)

#### `## Support` (optional)

Helpful notes for the developer: tested code snippets, links to repos with similar functionality, documentation links, related tickets. Only include when there is concrete technical guidance to pass on.

#### `## Data` (always)

Location of development data that can be used while working on the story. If no development data is available, state that explicitly — do not omit this subsection.

## Acceptance criteria

Acceptance criteria live in a dedicated Jira field (`customfield_10264`), **not** in the description body. Always generate them — do not skip this field.

Use simplified Gherkin. `GIVEN` is optional — only include it when there is meaningful precondition context that isn't implied:

```
**Scenario: {short description}**
GIVEN {precondition}  ← optional
WHEN {condition or action}
THEN {expected outcome}
```

- One scenario per distinct testable behaviour
- Use inline `code` for specific commands, values, or identifiers
- Keep each line concise — one condition, one outcome

Examples from real tickets:

> **Scenario: Script generates evolution reports**
> WHEN Script has run
> THEN Evolution reports are present

> **Scenario: Delimiter configurable on list commands**
> WHEN Running `thoughtspot {asset} list --delimiter {char}`
> THEN Output is correctly delimited

When creating the ticket via MCP, pass acceptance criteria in ADF format in `customfield_10264`, with the scenario title marked as bold.

## Style rules

- Link related Jira tickets using their key (e.g. `VEGA-641`) with context
- Reference GitHub repos by full URL
- Mention people as `@Name` when a specific person owns something
- Keep requirements as actionable bullets, not prose
- For sub-tasks within a requirement, indent them two levels deep
- Don't pad with filler prose; be concise and direct

## After drafting

Present the following clearly, then ask: **"Shall I create this in Jira?"**

1. **Title** — the full pipe-separated summary
2. **Description** — all sections (`# Background`, `# Requirements`, `# Development`)
3. **Acceptance Criteria** — all scenarios in Gherkin format

If they say **yes**, first call `mcp__atlassian__getAccessibleAtlassianResources` to obtain the `cloudId`, then create the ticket using `mcp__atlassian__createJiraIssue` with:
- `cloudId`: obtained from `getAccessibleAtlassianResources`
- `projectKey`: `VEGA`
- `issueTypeName`: `Story`
- `summary`: the title
- `contentFormat`: `markdown`
- `description`: the full description body in markdown format
- In `additional_fields`:
  - `customfield_10264`: acceptance criteria in ADF format with bold scenario titles
  - `customfield_10233`: Planned PI as `[{"id": "<id>"}]` — look up the correct ID by matching the `YYYY.Q` value against the options returned by `mcp__atlassian__getJiraIssueTypeMetaWithFields` for VEGA Stories, or use the known values: `2026.1=15423`, `2026.2=15424`, `2026.3=15425`, `2026.4=15426`
  - `customfield_10251`: `{"id": "14335"}` — Module Area (always "Backend")
  - `customfield_10217`: `[{"id": "10634"}]` — Country (always "All Countries")

After creating, inform the user that the **Team** field (`customfield_10001`) could not be set via the API and must be set manually on the ticket.

Return the created issue URL when done, then open it in the browser by running:

```shell
ticket {issue_key}
```

If they say **no**, ask: "What would you like to change?" — then update the draft accordingly and present it again for approval.
