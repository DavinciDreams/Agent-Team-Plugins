---
description: Show fullstack-dev team status and recent activity
argument-hint: [verbose]
---

# Full-Stack Dev Team Status

**Actions**:

1. Read `team.json` from the plugin root to display team composition
2. Check for the team log file at `~/.claude/team-logs/fullstack-dev.jsonl`
3. If the log exists, read the last 20 entries and summarize:
   - Recent tool usage by agent
   - Files touched
   - Time of last activity
4. Display team roster with roles, models, and workflow phases:

   | Agent | Role | Model | Phase |
   |-------|------|-------|-------|
   | code-explorer | Codebase Analyst | sonnet | discovery |
   | frontend-dev | Frontend Developer | sonnet | execution |
   | backend-dev | Backend Developer | sonnet | execution |
   | devops-engineer | DevOps Engineer | sonnet | execution |
   | qa-engineer | QA Engineer | sonnet | review |

5. If `$ARGUMENTS` contains "verbose", show full log entries

Present the information in a clean, formatted summary.
