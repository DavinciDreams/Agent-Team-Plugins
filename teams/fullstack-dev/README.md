# fullstack-dev

Full-stack development team with frontend, backend, QA, and DevOps agents that collaborate through phased workflows.

## Team Members

| Agent | Role | Model | Phase |
|-------|------|-------|-------|
| code-explorer | Codebase Analyst | sonnet | discovery |
| frontend-dev | Frontend Developer (React/TS/CSS) | sonnet | execution |
| backend-dev | Backend Developer (APIs/DB/Auth) | sonnet | execution |
| devops-engineer | DevOps Engineer (CI/CD/Deploy) | sonnet | execution |
| qa-engineer | QA Engineer (Testing/Validation) | sonnet | review |

## Usage

```
/fullstack-dev:fullstack Build a user dashboard with authentication
```

Check team status:

```
/fullstack-dev:status
```

## Workflow

### Feature Development (5 phases)

1. **Discovery** - Code explorer agents analyze the codebase across frontend, backend, and infrastructure
2. **Planning** - Design approach, ask clarifying questions, get user approval
3. **Execution** - Frontend, backend, and DevOps agents work in parallel
4. **Review** - QA engineer reviews for bugs, security, accessibility, and test coverage
5. **Summary** - Document all changes and suggest next steps

### Bug Fix (3 phases)

1. **Discovery** - Understand the bug across the stack
2. **Execution** - Fix and test
3. **Review** - QA validates the fix

## Skills

- **fullstack-conventions** - Coding standards across frontend and backend
- **api-design** - REST API design guidelines and response formats

## Telemetry

Tool usage is logged to `~/.claude/team-logs/fullstack-dev.jsonl` for observability.

## Dependencies

This team focuses on agents and commands. For MCP integrations, install separately:

```bash
claude plugin install github      # GitHub integration
claude plugin install playwright  # Browser testing
```
