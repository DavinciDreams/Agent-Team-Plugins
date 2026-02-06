---
name: api-design
description: API design guidelines for the fullstack-dev team
---

# API Design Guidelines

## REST Conventions
- Use plural nouns for resources: `/users`, `/posts`, `/comments`
- Use HTTP methods correctly: GET (read), POST (create), PUT (replace), PATCH (update), DELETE (remove)
- Nest sub-resources: `/users/:id/posts`
- Use query params for filtering: `/posts?status=published&author=123`
- Return proper status codes: 200, 201, 204, 400, 401, 403, 404, 409, 422, 500

## Response Shape
```json
{
  "data": {},
  "error": null,
  "meta": { "page": 1, "total": 42 }
}
```

## Error Response
```json
{
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": [{ "field": "email", "message": "Invalid format" }]
  }
}
```

## Input Validation
- Validate all input at the API boundary
- Return 422 with field-level error details for validation failures
- Sanitize strings to prevent injection
- Enforce size limits on all inputs

## Authentication
- Use the project's existing auth mechanism
- Apply auth middleware at the router level
- Return 401 for missing/invalid credentials
- Return 403 for insufficient permissions

## Versioning
- Follow the project's existing versioning strategy
- If none exists, prefer URL path versioning: `/api/v1/resource`
