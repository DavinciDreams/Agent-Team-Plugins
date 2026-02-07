# security

Security team for code security, vulnerability scanning, threat analysis, and compliance with threat analyst, security auditor, penetration tester, compliance officer, and incident responder agents that collaborate through phased workflows.

## Team Members

| Agent | Role | Model | Phase | Color |
|-------|------|-------|-------|-------|
| threat-analyst | Threat Analyst | sonnet | discovery | yellow |
| security-auditor | Security Auditor | sonnet | execution | green |
| pen-tester | Penetration Tester | sonnet | execution | cyan |
| compliance-officer | Compliance Officer | sonnet | execution | magenta |
| incident-responder | Incident Responder | sonnet | review | red |

## Usage

Activate the security team:

```
/security:security Perform a comprehensive security audit of our web application
```

Check team status:

```
/security:status
```

## Workflow

### Security Audit (5 phases)

1. **Discovery** - Threat analyst analyzes threat model, attack surface, and risks
2. **Planning** - Design audit approach, ask clarifying questions, get user approval
3. **Execution** - Security auditor, penetration tester, and compliance officer work in parallel
4. **Review** - Incident responder validates incident response readiness
5. **Summary** - Document findings and provide remediation recommendations

### Security Assessment (5 phases)

1. **Discovery** - Understand security landscape and threat model
2. **Planning** - Outline assessment strategy and scope
3. **Execution** - Conduct vulnerability scanning, penetration testing, and compliance assessment
4. **Review** - Validate findings and assess incident response readiness
5. **Summary** - Final security report with recommendations

### Remediation (3 phases)

1. **Discovery** - Identify vulnerabilities requiring remediation
2. **Execution** - Implement security fixes and controls
3. **Review** - Validate remediation effectiveness

### Incident Response (4 phases)

1. **Discovery** - Detect and triage security incident
2. **Execution** - Contain, eradicate, and recover from incident
3. **Review** - Conduct post-incident review and lessons learned
4. **Summary** - Document incident and recommendations for prevention

## Skills

- **threat-modeling** - Threat modeling methodologies (STRIDE, PASTA, LINDDUN), attack tree analysis, common attack patterns (OWASP Top 10, CWE), risk assessment frameworks, and security architecture patterns
- **vulnerability-scanning** - Static Application Security Testing (SAST), Dynamic Application Security Testing (DAST), Software Composition Analysis (SCA), container security scanning, dependency vulnerability management, and common vulnerability tools (Snyk, Trivy, OWASP ZAP, SonarQube)
- **secure-coding** - OWASP secure coding practices, language-specific security considerations, input validation and output encoding, authentication and authorization patterns, cryptography best practices, secure API design, and common security anti-patterns
- **compliance-frameworks** - SOC 2 compliance requirements, ISO 27001 standards, PCI DSS requirements, HIPAA security rules, GDPR data protection, NIST Cybersecurity Framework, and industry-specific compliance requirements

## Telemetry

Tool usage is logged to `~/.claude/team-logs/security.jsonl` for observability.
