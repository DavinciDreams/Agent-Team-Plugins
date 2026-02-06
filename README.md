# Atlas Agents - Claude Code Plugin Marketplace

Agent team plugins for Claude Code. Each team is a pre-configured group of specialized agents that collaborate through phased workflows.

## Available Teams

| Team | Description | Agents |
|------|-------------|--------|
| [fullstack-dev](./teams/fullstack-dev/) | Full-stack development | Frontend, Backend, QA, DevOps, Code Explorer |

## Installation

```bash
# Add the marketplace
claude plugin marketplace add atlas-agents/plugins

# Install a team
claude plugin install fullstack-dev
```

## Usage

After installing a team, use its slash command:

```
/fullstack-dev:fullstack Build a user dashboard with auth
```

Check team status:

```
/fullstack-dev:status
```

## Creating Teams

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to create new agent teams.

Use the scaffold script to bootstrap a new team:

```bash
bash scripts/scaffold-team.sh my-team "Team description" "agent-a agent-b agent-c"
```

## Architecture

Each team contains:

- **`team.json`** - Team manifest defining members, roles, models, and workflow phases
- **`commands/`** - Slash commands (orchestrator + status)
- **`agents/`** - Specialized agent definitions
- **`skills/`** - Team-specific conventions and guidelines
- **`hooks/`** - Telemetry and team logging

Teams are composable - they focus on agents/commands/skills. MCP servers (GitHub, Playwright, etc.) are installed separately from the official marketplace.

## Telemetry

Each team logs tool usage to `~/.claude/team-logs/{team}.jsonl` for observability. Structured for future LangSmith integration.
