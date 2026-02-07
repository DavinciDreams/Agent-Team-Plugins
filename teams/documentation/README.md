# documentation

Documentation team with doc analyst, technical writer, API docs specialist, tutorial author, and doc reviewer agents that collaborate through phased workflows.

## Team Members

| Agent | Role | Model | Phase | Color |
|-------|------|-------|-------|-------|
| doc-analyst | Documentation Analyst | sonnet | discovery | yellow |
| technical-writer | Technical Writer | sonnet | execution | green |
| api-docs-specialist | API Documentation Specialist | sonnet | execution | cyan |
| tutorial-author | Tutorial Author | sonnet | execution | magenta |
| doc-reviewer | Documentation Reviewer | sonnet | review | red |

## Usage

Activate the documentation team:

```
/documentation:docs Create comprehensive API documentation for the REST endpoints
```

Check team status:

```
/documentation:status
```

## Workflow

### Documentation Development (5 phases)

1. **Discovery** - Doc analyst researches existing documentation, identifies gaps, and assesses user needs
2. **Planning** - Design documentation approach, ask clarifying questions, get user approval
3. **Execution** - Technical writer, API docs specialist, and tutorial author work in parallel
4. **Review** - Doc reviewer checks for accuracy, clarity, consistency, and completeness
5. **Summary** - Document all changes and suggest next steps

### API Documentation (5 phases)

1. **Discovery** - Analyze API structure, endpoints, and existing documentation
2. **Planning** - Outline API documentation structure and OpenAPI spec requirements
3. **Execution** - Create OpenAPI specs, endpoint documentation, and interactive docs
4. **Review** - Validate API documentation accuracy and completeness
5. **Summary** - Final deliverables and recommendations

### Tutorial Creation (5 phases)

1. **Discovery** - Understand learning objectives and target audience
2. **Planning** - Design learning path and tutorial structure
3. **Execution** - Create step-by-step tutorials with examples and visuals
4. **Review** - Test tutorials and validate learning outcomes
5. **Summary** - Final deliverables and next steps

### Documentation Update (3 phases)

1. **Discovery** - Identify outdated content and update requirements
2. **Execution** - Update documentation with accurate information
3. **Review** - Validate updates and ensure consistency

## Skills

- **technical-writing** - Technical writing principles, style guides, writing for different audiences, structuring content, clear writing techniques, diagram creation
- **api-documentation** - OpenAPI/Swagger standards, REST API patterns, GraphQL documentation, API reference structure, interactive docs tools, code examples and SDK docs
- **documentation-tools** - Static site generators (Docusaurus, MkDocs, Hugo, Jekyll), documentation platforms (GitBook, ReadMe, Notion, Confluence), version control, deployment workflows, search optimization, analytics
- **content-strategy** - Documentation architecture, content planning and roadmaps, maintenance strategies, localization and internationalization, metrics and KPIs, user feedback integration

## Telemetry

Tool usage is logged to `~/.claude/team-logs/documentation.jsonl` for observability.
