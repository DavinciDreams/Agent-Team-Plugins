---
description: Show __TEAM__ team status and recent activity
argument-hint: [verbose]
---

# __TEAM__ Team Status

**Actions**:

1. Read `team.json` from the plugin root to display team composition
2. Check for the team log file at `~/.claude/team-logs/__TEAM__.jsonl`
3. If the log exists, read the last 20 entries and summarize:
   - Recent tool usage by agent
   - Files touched
   - Time of last activity
4. Display team roster with roles, models, and workflow phases
5. If `$ARGUMENTS` contains "verbose", show full log entries

Present the information in a clean, formatted table.
