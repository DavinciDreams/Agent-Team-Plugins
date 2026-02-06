# Contributing to Atlas Agents

## Creating a New Team

### Quick Start

```bash
bash scripts/scaffold-team.sh my-team "My team description" "agent-a agent-b agent-c"
```

This creates the full team structure under `teams/my-team/` from the template.

### Manual Setup

1. Copy `teams/_template/` to `teams/your-team/`
2. Update all placeholder values (search for `__TEAM__` and `__DESCRIPTION__`)
3. Create agent files in `agents/`
4. Define your orchestrator command in `commands/`
5. Add the team to `.claude-plugin/marketplace.json`

## Team Structure

```
teams/your-team/
  .claude-plugin/plugin.json   # Plugin metadata
  .mcp.json                    # MCP server config (empty if none)
  team.json                    # Team manifest
  commands/
    your-team.md               # Main orchestrator command
    status.md                  # Team status command
  agents/
    *.md                       # One file per agent
  skills/
    team-conventions/SKILL.md  # Coding conventions
  hooks/
    hooks.json                 # Hook configuration
    team-logger.py             # JSONL telemetry logger
  README.md                    # Team documentation
```

## Agent File Format

```markdown
---
name: teamname-agent-role
description: What this agent specializes in
tools: Glob, Grep, Read, Write, Edit, Bash
model: sonnet
color: cyan
---

You are a [role description].

## Core Mission
[What this agent does]

## Analysis/Execution Approach
[How the agent works]

## Output Guidance
[What the agent should return]
```

### Key Rules

- **Prefix agent names** with team name (e.g., `fullstack-frontend-dev`) to avoid namespace collisions
- **Specify model** - use `sonnet` for most agents, `opus` for complex reasoning
- **List tools explicitly** - only include tools the agent needs
- **Be specific** about what the agent should return

## Team Manifest (team.json)

```json
{
  "team": "your-team",
  "version": "1.0.0",
  "members": [
    {
      "agent": "agent-name",
      "role": "Human-readable Role",
      "model": "sonnet",
      "phase": "discovery"
    }
  ],
  "workflows": {
    "default": {
      "phases": ["discovery", "planning", "execution", "review", "summary"]
    }
  }
}
```

### Phases

- **discovery** - Understand codebase and requirements
- **planning** - Design approach, ask clarifying questions
- **execution** - Implement changes (agents can run in parallel)
- **review** - QA and code review
- **summary** - Document what was done

## Adding to Marketplace

Add your team to `.claude-plugin/marketplace.json`:

```json
{
  "name": "your-team",
  "description": "What your team does",
  "author": { "name": "atlas-agents" },
  "source": "./teams/your-team",
  "category": "development"
}
```

## Guidelines

- Keep agents focused - one clear responsibility per agent
- Use the code-explorer agent pattern for codebase analysis
- Test your team's orchestrator command end-to-end
- Document team-specific conventions in skills/
- Keep MCP dependencies separate - users install MCP plugins independently
