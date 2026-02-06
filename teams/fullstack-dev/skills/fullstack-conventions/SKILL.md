---
name: fullstack-conventions
description: Coding conventions and patterns for the fullstack-dev team
---

# Full-Stack Dev Team Conventions

## General
- Follow existing project conventions discovered during discovery phase
- Prefer readability over cleverness
- Keep functions focused and small
- Use TypeScript strictly - no `any` types without justification

## Frontend
- Use functional React components with hooks
- Define TypeScript interfaces for all component props
- Handle loading, error, and empty states in every data-fetching component
- Use semantic HTML elements (nav, main, article, section, etc.)
- Follow the project's styling approach exactly
- Keep component files under 200 lines - extract when larger

## Backend
- Validate all input at API boundaries
- Use proper HTTP status codes
- Return consistent response shapes: `{ data, error, meta }`
- Keep controllers thin, business logic in services
- Write database migrations for all schema changes
- Never expose internal errors to clients

## Testing
- Test user-visible behavior, not implementation details
- Every API endpoint needs at least one happy path and one error test
- Frontend components need tests for rendering and key interactions
- Use the project's existing test utilities and patterns

## Collaboration
- Each agent works within their defined scope
- Agents should not modify files outside their responsibility
- Frontend and backend agree on API contracts before implementation
- All changes must follow patterns found in the existing codebase
