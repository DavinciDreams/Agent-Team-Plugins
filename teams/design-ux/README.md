# design-ux

Design and UX team with user researcher, UX designer, UI designer, interaction designer, and design reviewer agents that collaborate through phased workflows.

## Team Members

| Agent | Role | Model | Phase | Color |
|-------|------|-------|-------|-------|
| user-researcher | User Researcher | sonnet | discovery | yellow |
| ux-designer | UX Designer | sonnet | execution | green |
| ui-designer | UI Designer | sonnet | execution | cyan |
| interaction-designer | Interaction Designer | sonnet | execution | magenta |
| design-reviewer | Design Reviewer | sonnet | review | red |

## Usage

Activate the design-ux team:

```
/design-ux:design Create a user-friendly dashboard for project management
```

Check team status:

```
/design-ux:status
```

## Workflow

### Research (3 phases)

1. **Discovery** - User researcher conducts user research and gathers insights
2. **Execution** - Design team creates research-based solutions
3. **Review** - Design reviewer validates findings and recommendations

### Design (5 phases)

1. **Discovery** - User researcher understands user needs and requirements
2. **Planning** - Design UX/UI approach and get user approval
3. **Execution** - UX designer, UI designer, and interaction designer work in parallel
4. **Review** - Design reviewer checks for quality, accessibility, and best practices
5. **Summary** - Document all designs and suggest next steps

### Prototype (5 phases)

1. **Discovery** - Understand prototyping requirements and user needs
2. **Planning** - Design prototype approach and get user approval
3. **Execution** - Create wireframes and interactive prototypes
4. **Review** - Validate prototypes for usability and accessibility
5. **Summary** - Final deliverables and recommendations

### Iteration (3 phases)

1. **Discovery** - Analyze feedback and identify improvement areas
2. **Execution** - Implement design iterations based on feedback
3. **Review** - Validate improvements and ensure quality

## Skills

- **user-research** - Research methodologies, user interviews, surveys, usability testing, persona creation, user journey mapping, A/B testing
- **design-systems** - Design system principles, component libraries (Material Design, Ant Design, Tailwind, shadcn/ui), typography, color theory, spacing systems, icons, design tokens
- **wireframing-prototyping** - Wireframing tools (Figma, Sketch, Adobe XD, Balsamiq), low/high-fidelity prototypes, user flows, sitemaps, design handoff
- **accessibility** - WCAG 2.1 guidelines, screen reader compatibility, keyboard navigation, color contrast, semantic HTML, ARIA attributes, accessibility testing

## Telemetry

Tool usage is logged to `~/.claude/team-logs/design-ux.jsonl` for observability.
