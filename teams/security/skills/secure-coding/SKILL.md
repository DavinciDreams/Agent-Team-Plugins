---
name: secure-coding
description: OWASP secure coding practices, language-specific security considerations, input validation and output encoding, authentication and authorization patterns, cryptography best practices, secure API design, and common security anti-patterns
---

# Secure Coding

## OWASP Secure Coding Practices

### Input Validation

- **Validate All Input**: Validate all input from untrusted sources (user input, APIs, files)
- **Whitelist Approach**: Use whitelisting (allow-list) instead of blacklisting
- **Validate Type, Length, Format**: Validate data type, length, and format
- **Sanitize Output**: Encode output to prevent injection attacks
- **Canonicalize Input**: Canonicalize input before validation to prevent bypasses

### Output Encoding

- **Context-Specific Encoding**: Use encoding appropriate for the context (HTML, JavaScript, URL, CSS)
- **Encode User-Generated Content**: Encode all user-generated content before output
- **Use Framework Encoding**: Use framework-provided encoding functions
- **Avoid Manual Encoding**: Avoid manual encoding as it's error-prone

### Authentication

- **Strong Passwords**: Enforce strong password policies (length, complexity, rotation)
- **Secure Password Storage**: Use strong, slow hashing algorithms (bcrypt, Argon2, scrypt)
- **Multi-Factor Authentication**: Implement MFA for sensitive operations
- **Secure Session Management**: Use secure, HTTP-only, SameSite cookies
- **Session Expiration**: Implement appropriate session timeout
- **Secure Password Reset**: Implement secure password reset mechanisms

### Authorization

- **Principle of Least Privilege**: Grant minimum necessary permissions
- **Role-Based Access Control**: Implement RBAC for authorization
- **Attribute-Based Access Control**: Consider ABAC for complex authorization
- **Deny by Default**: Deny access by default, explicitly allow
- **Check Authorization on Every Request**: Verify authorization on every request
- **Avoid IDOR**: Prevent Insecure Direct Object References

### Cryptography

- **Use Standard Algorithms**: Use well-vetted, standard cryptographic algorithms
- **Avoid Rolling Your Own Crypto**: Never implement custom cryptography
- **Use Secure Key Management**: Properly generate, store, and rotate keys
- **Use Authenticated Encryption**: Use authenticated encryption (AEAD) when possible
- **Avoid Deprecated Algorithms**: Avoid MD5, SHA1, RC4, DES, etc.
- **Use TLS**: Use TLS for all network communications

### Error Handling

- **Generic Error Messages**: Use generic error messages for users
- **Detailed Logging**: Log detailed error information server-side
- **Don't Leak Information**: Avoid leaking sensitive information in errors
- **Handle Exceptions**: Properly handle exceptions to prevent information disclosure
- **Custom Error Pages**: Use custom error pages to prevent information leakage

## Language-Specific Security Considerations

### JavaScript/TypeScript

- **XSS Prevention**: Use frameworks with built-in XSS protection (React, Vue, Angular)
- **Content Security Policy**: Implement CSP to mitigate XSS
- **Avoid eval()**: Avoid using eval() and similar dynamic code execution
- **Validate JSON**: Validate JSON input before parsing
- **Use Strict Mode**: Use strict mode to catch common errors
- **Sanitize HTML**: Use DOMPurify or similar libraries for HTML sanitization

### Python

- **SQL Injection**: Use parameterized queries or ORM
- **Command Injection**: Avoid shell=True in subprocess calls
- **Pickle Security**: Avoid unpickling untrusted data
- **Template Injection**: Use secure template engines (Jinja2 auto-escaping)
- **YAML Loading**: Use yaml.safe_load() instead of yaml.load()
- **Input Validation**: Validate input using libraries like pydantic

### Java

- **SQL Injection**: Use PreparedStatement or JPA
- **XSS Prevention**: Use OWASP ESAPI or framework-provided encoding
- **Deserialization**: Avoid deserializing untrusted data
- **XML Security**: Disable XML external entities (XXE)
- **Path Traversal**: Validate file paths to prevent directory traversal
- **Secure Random**: Use SecureRandom for cryptographic random numbers

### Go

- **SQL Injection**: Use prepared statements with sql package
- **Path Traversal**: Use filepath.Join() and validate paths
- **Command Injection**: Avoid shell commands, use exec package
- **Template Injection**: Use html/template with auto-escaping
- **Error Handling**: Always handle errors explicitly
- **Input Validation**: Validate input before use

### C/C++

- **Buffer Overflows**: Use safe string functions (strncpy_s, snprintf)
- **Memory Safety**: Use memory-safe alternatives when possible
- **Integer Overflow**: Check for integer overflow before arithmetic
- **Format String Vulnerabilities**: Avoid user-controlled format strings
- **Use Safe Libraries**: Use safe string and memory libraries
- **Static Analysis**: Use static analysis tools to catch issues

### PHP

- **SQL Injection**: Use PDO with prepared statements
- **XSS Prevention**: Use htmlspecialchars() or framework escaping
- **File Upload**: Validate and sanitize uploaded files
- **Include Files**: Avoid user-controlled include files
- **Type Juggling**: Be aware of PHP's type juggling
- **Configuration**: Use secure configuration settings

## Input Validation and Output Encoding

### Input Validation Techniques

- **Type Validation**: Validate data type (integer, string, date, etc.)
- **Length Validation**: Validate minimum and maximum length
- **Format Validation**: Validate format (email, phone, URL, etc.)
- **Range Validation**: Validate numeric ranges
- **Pattern Validation**: Use regex patterns for complex validation
- **Business Rule Validation**: Validate against business rules

### Output Encoding Contexts

- **HTML Context**: Encode for HTML entities (<, >, &, ", ')
- **JavaScript Context**: Encode for JavaScript strings
- **URL Context**: Encode for URL parameters
- **CSS Context**: Encode for CSS values
- **Attribute Context**: Encode for HTML attributes

### Encoding Libraries

- **JavaScript**: DOMPurify, encodeURI(), encodeURIComponent()
- **Python**: html.escape(), urllib.parse.quote()
- **Java**: OWASP ESAPI, Apache Commons Text
- **Go**: html.EscapeString(), url.QueryEscape()
- **PHP**: htmlspecialchars(), urlencode()

## Authentication and Authorization Patterns

### Authentication Patterns

- **Multi-Factor Authentication**: Require multiple factors for authentication
- **Password Hashing**: Use bcrypt, Argon2, or scrypt for password hashing
- **Password Policies**: Enforce strong password policies
- **Account Lockout**: Implement account lockout after failed attempts
- **Password Reset**: Implement secure password reset flows
- **Session Management**: Use secure session management practices

### Authorization Patterns

- **Role-Based Access Control (RBAC)**: Assign permissions to roles, roles to users
- **Attribute-Based Access Control (ABAC)**: Use attributes for fine-grained access control
- **Access Control Lists (ACL)**: Define access rights for resources
- **Capability-Based Security**: Use capabilities for access control
- **Policy-Based Access Control**: Use policies for access decisions
- **Hybrid Approaches**: Combine multiple authorization patterns

### Session Management

- **Secure Cookies**: Use secure, HTTP-only, SameSite cookies
- **Session Expiration**: Implement appropriate session timeout
- **Session Fixation**: Generate new session ID after authentication
- **Session Storage**: Store session data securely
- **Logout**: Implement proper logout functionality
- **Concurrent Sessions**: Limit concurrent sessions if needed

## Cryptography Best Practices

### Encryption

- **Use Standard Algorithms**: Use AES-256, ChaCha20-Poly1305, or similar
- **Use Authenticated Encryption**: Prefer AEAD modes (GCM, CCM, ChaCha20-Poly1305)
- **Key Management**: Use proper key management (HSM, KMS, key rotation)
- **IV/Nonce**: Use unique IV/nonce for each encryption
- **Key Derivation**: Use PBKDF2, Argon2, or scrypt for key derivation
- **Avoid ECB Mode**: Never use ECB mode for encryption

### Hashing

- **Use Strong Hashes**: Use SHA-256 or stronger for general hashing
- **Password Hashing**: Use bcrypt, Argon2, or scrypt for passwords
- **Salt**: Use unique salt for each password hash
- **Slow Hashing**: Use computationally expensive hashing for passwords
- **Avoid MD5/SHA1**: Avoid MD5 and SHA1 for security purposes

### Key Management

- **Key Generation**: Use cryptographically secure random number generators
- **Key Storage**: Store keys securely (HSM, KMS, encrypted at rest)
- **Key Rotation**: Rotate keys regularly
- **Key Separation**: Use different keys for different purposes
- **Key Destruction**: Securely destroy keys when no longer needed
- **Key Escrow**: Consider key escrow for recovery if needed

### TLS/SSL

- **Use TLS 1.3**: Prefer TLS 1.3 when available
- **Strong Ciphers**: Use strong cipher suites
- **Certificate Validation**: Always validate certificates
- **HSTS**: Implement HTTP Strict Transport Security
- **Perfect Forward Secrecy**: Use cipher suites with PFS
- **Disable Weak Protocols**: Disable SSLv2, SSLv3, TLS 1.0, TLS 1.1

## Secure API Design

### API Security Best Practices

- **Authentication**: Implement strong authentication (OAuth 2.0, JWT, API keys)
- **Authorization**: Implement proper authorization for all endpoints
- **Rate Limiting**: Implement rate limiting to prevent abuse
- **Input Validation**: Validate all input to API endpoints
- **Output Encoding**: Encode output appropriately
- **Error Handling**: Use generic error messages, log details server-side
- **HTTPS**: Always use HTTPS for API communication
- **API Versioning**: Use versioning to manage breaking changes
- **Documentation**: Document security considerations
- **Monitoring**: Monitor API usage for anomalies

### REST API Security

- **Stateless**: Keep APIs stateless
- **Resource-Based Design**: Design around resources
- **HTTP Methods**: Use HTTP methods correctly (GET, POST, PUT, DELETE)
- **Status Codes**: Use appropriate HTTP status codes
- **Pagination**: Implement pagination for large datasets
- **Filtering/Sorting**: Allow filtering and sorting
- **CORS**: Configure CORS appropriately
- **CSRF**: Implement CSRF protection for state-changing operations

### GraphQL Security

- **Query Depth Limiting**: Limit query depth to prevent DoS
- **Query Complexity Limiting**: Limit query complexity
- **Rate Limiting**: Implement rate limiting
- **Authentication**: Implement authentication at the resolver level
- **Authorization**: Implement authorization at the resolver level
- **Introspection**: Disable introspection in production
- **Field-Level Authorization**: Implement field-level authorization

## Common Security Anti-Patterns

### Code Anti-Patterns

- **Hardcoded Secrets**: Never hardcode passwords, API keys, or tokens
- **SQL String Concatenation**: Never concatenate SQL strings
- **Shell Command Concatenation**: Never concatenate shell commands
- **eval() Usage**: Avoid using eval() or similar functions
- **Trust Client-Side Validation**: Never trust client-side validation
- **Ignore Error Messages**: Don't ignore error messages
- **Roll Your Own Crypto**: Never implement custom cryptography

### Configuration Anti-Patterns

- **Default Credentials**: Never use default credentials in production
- **Debug Mode**: Never enable debug mode in production
- **Verbose Error Messages**: Don't expose detailed errors to users
- **Insecure Defaults**: Don't use insecure default configurations
- **Unnecessary Services**: Don't run unnecessary services
- **Open Ports**: Don't expose unnecessary ports

### Architecture Anti-Patterns

- **Security Through Obscurity**: Never rely on obscurity for security
- **Single Layer of Defense**: Never rely on a single security control
- **Trust Boundaries**: Don't trust components across trust boundaries
- **Assume Safe Input**: Never assume input is safe
- **Ignore Logging**: Don't ignore security logging
- **Skip Testing**: Never skip security testing

### Development Anti-Patterns

- **Skip Code Review**: Never skip security code reviews
- **Ignore Dependencies**: Don't ignore dependency vulnerabilities
- **Rush Deployment**: Don't rush deployments without testing
- **Disable Security Controls**: Never disable security controls for convenience
- **Ignore Alerts**: Don't ignore security alerts
- **Assume It's Secure**: Never assume something is secure without verification
