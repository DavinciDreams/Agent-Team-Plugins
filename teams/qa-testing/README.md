# qa-testing

QA and testing team with test analyst, automation engineer, manual tester, performance tester, and QA reviewer agents that collaborate through phased workflows for comprehensive testing and quality assurance.

## Team Members

| Agent | Role | Model | Phase | Color |
|-------|------|-------|-------|-------|
| test-analyst | Test Analyst | sonnet | discovery | yellow |
| automation-engineer | Automation Engineer | sonnet | execution | green |
| manual-tester | Manual Tester | sonnet | execution | cyan |
| performance-tester | Performance Tester | sonnet | execution | magenta |
| qa-reviewer | QA Reviewer | sonnet | review | red |

## Usage

Activate the qa-testing team:

```
/qa-testing:qa Create automated tests for the user authentication feature
```

Check team status:

```
/qa-testing:status
```

## Workflow

### Testing (5 phases)

1. **Discovery** - Test analyst researches requirements, identifies test cases, and assesses testing scope
2. **Planning** - Design testing approach, select frameworks, define quality gates, get user approval
3. **Execution** - Automation engineer, manual tester, and performance tester work in parallel
4. **Review** - QA reviewer checks coverage, quality, and compliance
5. **Summary** - Document all tests, coverage, and recommendations

### Automation (5 phases)

1. **Discovery** - Understand automation requirements and scope
2. **Planning** - Select frameworks, design test architecture, get user approval
3. **Execution** - Build automated tests and CI/CD integration
4. **Review** - Validate test quality and coverage
5. **Summary** - Final test suite and documentation

### Performance (5 phases)

1. **Discovery** - Analyze performance requirements and SLAs
2. **Planning** - Design performance test scenarios, get user approval
3. **Execution** - Execute load, stress, and performance tests
4. **Review** - Analyze results and identify bottlenecks
5. **Summary** - Performance report and recommendations

### Regression (3 phases)

1. **Discovery** - Analyze changes and identify regression risks
2. **Execution** - Execute regression tests
3. **Review** - Validate no regressions introduced

## Skills

- **test-automation** - Test automation strategies, design patterns (POM, Screenplay), test data management, mocking, flaky test prevention, test reporting
- **test-frameworks** - Web frameworks (Selenium, Cypress, Playwright, Puppeteer), JavaScript testing (Jest, Mocha, Vitest), Python testing (pytest, unittest), Java testing (JUnit, TestNG), Mobile testing (Appium, Espresso, XCUITest), API testing (Postman, REST Assured, Supertest)
- **performance-testing** - Performance testing types (load, stress, spike, soak, volume), tools (JMeter, Gatling, k6, Locust), key metrics (response time, throughput, error rate), performance profiling, baselines and SLAs, cloud-based testing
- **quality-metrics** - Test coverage metrics (line, branch, function, statement), code quality metrics (cyclomatic complexity, maintainability), defect metrics (density, removal efficiency), quality gates, test reporting, QA KPIs

## Telemetry

Tool usage is logged to `~/.claude/team-logs/qa-testing.jsonl` for observability.
