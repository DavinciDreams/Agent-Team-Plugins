---
name: threat-modeling
description: Threat modeling methodologies (STRIDE, PASTA, LINDDUN), attack tree analysis, common attack patterns (OWASP Top 10, CWE), risk assessment frameworks, and security architecture patterns
---

# Threat Modeling

## Threat Modeling Methodologies

### STRIDE

STRIDE is a threat modeling framework developed by Microsoft that categorizes threats into six categories:

- **Spoofing**: Impersonating something or someone else
  - Examples: Fake authentication tokens, DNS spoofing, email spoofing
  - Controls: Strong authentication, certificate validation, anti-spoofing measures

- **Tampering**: Modifying data or code without authorization
  - Examples: Man-in-the-middle attacks, code injection, data tampering
  - Controls: Digital signatures, integrity checks, secure communication channels

- **Repudiation**: Denying having performed an action
  - Examples: Denying a transaction, denying access to resources
  - Controls: Audit logging, non-repudiation services, digital signatures

- **Information Disclosure**: Exposing information to unauthorized parties
  - Examples: Data leakage, sensitive information in logs, insecure storage
  - Controls: Encryption, access controls, data masking, secure logging

- **Denial of Service**: Making a service unavailable
  - Examples: DDoS attacks, resource exhaustion, application crashes
  - Controls: Rate limiting, throttling, redundancy, monitoring

- **Elevation of Privilege**: Gaining unauthorized higher-level access
  - Examples: Privilege escalation, bypassing authorization checks
  - Controls: Principle of least privilege, secure authorization, input validation

### PASTA Framework

Process for Attack Simulation and Threat Analysis (PASTA) is a seven-step risk-centric methodology:

1. **Define Objectives**: Establish business objectives and compliance requirements
2. **Define Technical Scope**: Identify assets, data flows, and technical architecture
3. **Application Decomposition**: Analyze application architecture and data flows
4. **Threat Analysis**: Identify threats using threat intelligence and attack patterns
5. **Vulnerability Analysis**: Identify and assess vulnerabilities in the system
6. **Attack Modeling**: Model potential attacks and their impact
7. **Risk Analysis**: Assess and prioritize risks based on business impact

### LINDDUN Framework

LINDDUN is a privacy-focused threat modeling framework:

- **Linkability**: Ability to link data to individuals
- **Identifiability**: Ability to identify individuals from data
- **Non-repudiation**: Inability to deny actions
- **Detectability**: Ability to detect data processing
- **Disclosure of Information**: Unauthorized information disclosure
- **Unawareness**: Individuals unaware of data processing
- **Non-compliance**: Failure to comply with regulations

## Attack Tree Analysis

### Attack Tree Structure

Attack trees are hierarchical diagrams that represent different ways an attacker might achieve a goal:

- **Root Node**: The attacker's ultimate goal
- **Intermediate Nodes**: Sub-goals or attack vectors
- **Leaf Nodes**: Specific attack techniques or exploits

### Attack Tree Analysis Process

1. **Define Attack Goal**: Identify what the attacker wants to achieve
2. **Identify Attack Vectors**: Brainstorm different ways to achieve the goal
3. **Break Down Vectors**: Decompose each vector into smaller steps
4. **Assign Values**: Assign difficulty, cost, and risk values to each node
5. **Analyze Paths**: Identify the most likely attack paths
6. **Identify Mitigations**: Determine controls to block each path

### Common Attack Patterns

- **Authentication Attacks**: Credential stuffing, brute force, password spraying
- **Authorization Attacks**: Privilege escalation, IDOR, broken access controls
- **Injection Attacks**: SQL injection, command injection, XSS, LDAP injection
- **Cryptographic Attacks**: Weak algorithms, key management issues, padding oracle
- **Network Attacks**: MITM, DNS poisoning, ARP spoofing, BGP hijacking
- **Social Engineering**: Phishing, pretexting, baiting, tailgating

## Common Attack Patterns

### OWASP Top 10

1. **Broken Access Control**: Restrictions on authenticated users are not properly enforced
2. **Cryptographic Failures**: Failures related to cryptography and protection of sensitive data
3. **Injection**: Injection flaws allow attackers to execute malicious commands
4. **Insecure Design**: Flaws in design and architecture that enable security issues
5. **Security Misconfiguration**: Improperly configured security settings
6. **Vulnerable and Outdated Components**: Using components with known vulnerabilities
7. **Identification and Authentication Failures**: Weaknesses in identity and authentication
8. **Software and Data Integrity Failures**: Code and infrastructure without integrity protection
9. **Security Logging and Monitoring Failures**: Insufficient logging and monitoring
10. **Server-Side Request Forgery (SSRF)**: Server makes requests to unintended locations

### Common Weakness Enumeration (CWE)

- **CWE-79**: Cross-site Scripting (XSS)
- **CWE-89**: SQL Injection
- **CWE-200**: Information Exposure
- **CWE-352**: Cross-Site Request Forgery (CSRF)
- **CWE-400**: Uncontrolled Resource Consumption
- **CWE-502**: Deserialization of Untrusted Data
- **CWE-732**: Incorrect Permission Assignment
- **CWE-798**: Use of Hard-coded Credentials
- **CWE-862**: Missing Authorization
- **CWE-863**: Incorrect Authorization

## Risk Assessment Frameworks

### CVSS (Common Vulnerability Scoring System)

CVSS provides a standardized way to assess vulnerability severity:

- **Base Score**: Intrinsic qualities of the vulnerability (Exploitability, Impact)
- **Temporal Score**: Characteristics that change over time (Exploit Code Maturity, Remediation Level)
- **Environmental Score**: Characteristics specific to the user's environment

### DREAD

DREAD is a risk assessment model:

- **Damage**: How much damage could be caused?
- **Reproducibility**: How easily can the vulnerability be reproduced?
- **Exploitability**: How easy is it to exploit?
- **Affected Users**: How many users are affected?
- **Discoverability**: How easy is it to discover?

### OWASP Risk Rating

OWASP provides a risk rating methodology:

- **Likelihood**: Ease of discovery, ease of exploit, awareness, intrusion detection
- **Impact**: Technical impact, business impact
- **Risk Score**: Likelihood × Impact

## Security Architecture Patterns

### Defense in Depth

Layered security controls provide multiple levels of protection:

- **Perimeter Security**: Firewalls, WAFs, DDoS protection
- **Network Security**: Network segmentation, IDS/IPS, VPN
- **Host Security**: Endpoint protection, HIDS, application whitelisting
- **Application Security**: Input validation, authentication, authorization
- **Data Security**: Encryption, access controls, data loss prevention

### Zero Trust Architecture

Never trust, always verify:

- **Identity Verification**: Strong authentication for all access requests
- **Device Trust**: Verify device health and compliance
- **Least Privilege**: Grant minimum necessary access
- **Micro-segmentation**: Segment networks to limit lateral movement
- **Continuous Monitoring**: Monitor and log all access and activity

### Secure by Design

Incorporate security from the beginning:

- **Threat Modeling**: Identify threats early in design
- **Secure Defaults**: Default to secure configurations
- **Principle of Least Privilege**: Minimize permissions
- **Defense in Depth**: Multiple layers of security
- **Fail Secure**: Fail to a secure state
- **Security by Design**: Design security into the system
