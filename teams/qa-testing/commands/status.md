---
description: Show qa-testing team status and recent activity
argument-hint: [verbose]
---

# QA Testing Team Status

**Actions**:

1. Read `team.json` from the plugin root to display team composition
2. Check for the team log file at `~/.claude/team-logs/qa-testing.jsonl`
3. If the log exists, read the last 20 entries and summarize:
   - Recent tool usage by agent
   - Files touched
   - Time of last activity
4. Display team roster with roles, models, workflow phases, and colors
5. If `$ARGUMENTS` contains "verbose", show full log entries

Present the information in a clean, formatted table.
