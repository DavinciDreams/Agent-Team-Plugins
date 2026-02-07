---
name: api-documentation
description: OpenAPI/Swagger specification standards and API documentation best practices
---

# API Documentation

## OpenAPI/Swagger Specification Standards

### OpenAPI 3.0 Specification
- **OpenAPI Object**: Root object containing API metadata and paths
- **Info Object**: API title, version, description, and contact information
- **Paths Object**: Available endpoints and operations
- **Components Object**: Reusable schemas, parameters, responses, and examples
- **Security Object**: Authentication and authorization schemes
- **Servers Object**: API server URLs and configurations

### Key Elements
- **Paths**: Define endpoints with HTTP methods (GET, POST, PUT, DELETE, etc.)
- **Parameters**: Query, path, header, and cookie parameters with types and constraints
- **Request Body**: Payload schemas with content types (application/json, etc.)
- **Responses**: Status codes, descriptions, and response schemas
- **Examples**: Request and response examples for each operation
- **Tags**: Group operations for organization and navigation

## REST API Documentation Patterns

### Endpoint Documentation
- **URL Pattern**: Clear, RESTful URL structure (e.g., `/api/v1/users/{id}`)
- **HTTP Method**: Appropriate method for the operation (GET, POST, PUT, PATCH, DELETE)
- **Description**: Clear explanation of what the endpoint does
- **Parameters**: All parameters with types, required/optional status, and constraints
- **Request Body**: Schema and examples for POST/PUT/PATCH operations
- **Responses**: All possible responses with status codes, schemas, and examples
- **Authentication**: Required authentication method and token format

### Response Documentation
- **Success Responses**: Document successful responses with examples
- **Error Responses**: Document all error responses with codes and messages
- **Status Codes**: Use appropriate HTTP status codes (200, 201, 400, 401, 404, 500, etc.)
- **Response Schema**: JSON schema with field types, descriptions, and constraints
- **Response Examples**: Multiple examples showing different scenarios

### Pagination
- **Pagination Parameters**: Document page size, page number, offset, and limit
- **Response Metadata**: Include total count, page count, and next/previous links
- **Pagination Examples**: Show how to navigate through pages
- **Best Practices**: Recommend default page sizes and maximum limits

## GraphQL Documentation Practices

### Schema Documentation
- **Types**: Document all object types, input types, and enums
- **Fields**: Document each field with type, arguments, and description
- **Queries and Mutations**: Document all available operations with parameters and return types
- **Subscriptions**: Document real-time subscriptions with events and payloads
- **Directives**: Document custom directives and their usage

### Query Documentation
- **Operation Name**: Clear, descriptive operation names
- **Arguments**: All arguments with types, required/optional status, and descriptions
- **Return Type**: Document the return type structure
- **Examples**: Provide query examples with variables
- **Error Handling**: Document error responses and error types

## API Reference Documentation Structure

### Organization
- **Overview**: High-level introduction to the API
- **Authentication**: How to authenticate requests
- **Quick Start**: Simple example to get started
- **Endpoints**: Complete reference of all endpoints
- **Data Models**: Common data structures and schemas
- **Error Codes**: List of error codes and their meanings
- **Rate Limits**: Rate limiting policies and best practices
- **Changelog**: Version history and changes

### Endpoint Reference
- **Grouping**: Group endpoints by resource or functionality
- **Navigation**: Clear navigation structure with breadcrumbs
- **Search**: Searchable endpoint names and descriptions
- **Filtering**: Filter by HTTP method, tag, or resource
- **Try It Out**: Interactive testing capability

## Interactive API Documentation Tools

### Swagger UI
- **Features**: Interactive API exploration, "Try it out" functionality
- **Customization**: Custom branding, themes, and plugins
- **Deployment**: Can be deployed as static files or embedded
- **Authentication**: Support for various auth methods (API key, OAuth, etc.)
- **Validation**: Real-time request/response validation

### Redoc
- **Features**: Beautiful, responsive documentation from OpenAPI specs
- **Three-Panel Layout**: Navigation, content, and code panels
- **Search**: Full-text search across documentation
- **Mobile Friendly**: Responsive design for mobile devices
- **Code Samples**: Automatic code sample generation

### Stoplight
- **Features**: API design, documentation, and testing platform
- **Visual Editor**: Visual API designer with drag-and-drop
- **Mock Server**: Automatic mock server generation
- **Testing**: Built-in API testing and validation
- **Collaboration**: Team collaboration features

## Code Examples and SDK Documentation

### Language Examples
- **Multiple Languages**: Provide examples in JavaScript, Python, Java, cURL, etc.
- **Complete Examples**: Full, runnable code samples
- **Error Handling**: Include error handling in examples
- **Comments**: Explain what the code does
- **Best Practices**: Demonstrate best practices in examples

### SDK Documentation
- **Installation**: How to install and configure the SDK
- **Initialization**: How to initialize the client
- **Authentication**: How to authenticate with the SDK
- **Methods**: Document all SDK methods with parameters and return types
- **Examples**: Provide usage examples for common operations
- **Error Handling**: How to handle errors and exceptions

### cURL Examples
- **Complete Commands**: Full cURL commands with all options
- **Headers**: Include all required headers
- **Authentication**: Show authentication in cURL format
- **Request Body**: Include request body for POST/PUT operations
- **Comments**: Add comments to explain options
