# __TEAM__

__DESCRIPTION__

## Team Members

| Agent | Role | Model | Phase |
|-------|------|-------|-------|
| code-explorer | Codebase Analyst | sonnet | discovery |
| __AGENT_1__ | __ROLE_1__ | sonnet | execution |

## Usage

```
/__TEAM__:team <task description>
```

Check status:

```
/__TEAM__:status
```

## Workflows

### Feature Development
1. **Discovery** - Code explorer analyzes the codebase
2. **Planning** - Design approach, ask clarifying questions
3. **Execution** - Specialist agents implement in parallel
4. **Review** - QA validation
5. **Summary** - Document changes

### Bug Fix
1. **Discovery** - Understand the bug
2. **Execution** - Fix and test
3. **Review** - Validate fix

## Telemetry

Tool usage is logged to `~/.claude/team-logs/__TEAM__.jsonl`.
