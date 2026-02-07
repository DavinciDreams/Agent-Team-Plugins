---
name: quality-metrics
description: Test coverage, code quality, defect metrics, and QA KPIs
---

# Quality Metrics

## Test Coverage Metrics

### Code Coverage Types
- **Line Coverage**: Percentage of executable lines executed
- **Branch Coverage**: Percentage of conditional branches taken
- **Function Coverage**: Percentage of functions/methods called
- **Statement Coverage**: Percentage of statements executed
- **Condition Coverage**: Percentage of boolean sub-conditions evaluated

### Coverage Targets
```
Critical Business Logic: 90-100%
Core Application Code: 80-90%
Utility/Helper Code: 70-80%
Configuration/Setup Code: 50-70%
```

### Coverage Tools
- **JavaScript**: Istanbul, nyc, Jest coverage
- **Python**: pytest-cov, coverage.py
- **Java**: JaCoCo, Cobertura
- **.NET**: dotCover, Coverlet
- **Go**: go test -cover

### Coverage Best Practices
- Focus on meaningful coverage, not just percentage
- Prioritize coverage of critical paths
- Track coverage trends over time
- Set coverage gates in CI/CD
- Review uncovered code regularly

## Code Quality Metrics

### Cyclomatic Complexity
- Measures code complexity based on control flow
- Higher complexity = harder to test and maintain
- Target: < 10 per function/method

```
Complexity Levels:
1-10: Simple, low risk
11-20: Moderate complexity, medium risk
21-50: High complexity, high risk
50+: Very high complexity, very high risk
```

### Maintainability Index
- Composite metric combining complexity, volume, and structure
- Scale: 0-100 (higher is better)
- Target: > 70

```
Maintainability Levels:
85-100: Highly maintainable
70-84: Moderately maintainable
50-69: Difficult to maintain
0-49: Very difficult to maintain
```

### Code Duplication
- Percentage of duplicated code
- Target: < 5%
- High duplication indicates need for refactoring

### Code Smells
- **Long Methods**: Methods > 50 lines
- **Large Classes**: Classes > 500 lines
- **Deep Nesting**: Nesting > 4 levels
- **Long Parameter Lists**: > 4 parameters
- **Feature Envy**: Methods using other objects more than their own

### Technical Debt Ratio
```
Technical Debt Ratio = Cost to Fix Issues / Cost to Develop New Features
Target: < 5%
```

## Defect Metrics

### Defect Density
- Defects per thousand lines of code (KLOC)
- Defects per function point
- Defects per module/component

```
Defect Density = Total Defects / Size Metric (KLOC, FP)
Target: < 1 defect per KLOC
```

### Defect Removal Efficiency (DRE)
- Percentage of defects found before release
- Higher is better

```
DRE = (Defects Found Before Release / Total Defects) × 100
Target: > 90%
```

### Defect Leakage
- Percentage of defects found after release
- Lower is better

```
Defect Leakage = (Defects Found After Release / Total Defects) × 100
Target: < 10%
```

### Defect Age
- Time from defect introduction to detection
- Time from defect detection to resolution

```
Defect Age = Detection Date - Introduction Date
Resolution Time = Resolution Date - Detection Date
Target: < 7 days for critical defects
```

### Defect Severity Distribution
- **Critical**: System failure, data loss
- **High**: Major functionality broken
- **Medium**: Minor functionality broken
- **Low**: Cosmetic issues, typos

### Defect Trend Analysis
- Track defects over time
- Identify patterns and trends
- Correlate with code changes
- Predict future defect rates

## Quality Gates and Acceptance Criteria

### Quality Gate Examples
```
Code Quality Gate:
- Code coverage ≥ 80%
- No critical or high severity defects
- Cyclomatic complexity ≤ 10
- No security vulnerabilities
- All tests passing

Performance Gate:
- p95 response time < 500ms
- Error rate < 0.1%
- Throughput ≥ 1000 RPS
- CPU utilization < 70%

Security Gate:
- No high/critical vulnerabilities
- OWASP Top 10 compliance
- Dependency scan clean
- Authentication/authorization tested
```

### Acceptance Criteria
- **Functional Requirements**: All features work as specified
- **Non-Functional Requirements**: Performance, security, usability met
- **Test Coverage**: Minimum coverage thresholds met
- **Defect Standards**: No defects above acceptable severity
- **Documentation**: All documentation complete and accurate

## Test Reporting and Dashboards

### Test Execution Reports
- Total tests run
- Pass/fail counts and percentages
- Test execution time
- Flaky test identification
- Test failure categorization

### Coverage Reports
- Line, branch, function coverage
- Coverage by module/component
- Uncovered code highlighting
- Coverage trends over time
- Coverage comparison between branches

### Defect Reports
- Open defects by severity
- Defect trends and patterns
- Defect age distribution
- Defect resolution time
- Defect density by module

### Performance Reports
- Response time metrics (p50, p95, p99)
- Throughput metrics
- Error rates
- Resource utilization
- Performance trends over time

### Dashboard Elements
- Overall quality score
- Test coverage gauge
- Defect trend chart
- Performance metrics
- Build health status
- Quality gate status

## QA KPIs and Metrics Tracking

### Process Metrics
- **Test Execution Time**: Time to run test suite
- **Test Automation Rate**: Percentage of tests automated
- **Test Case Count**: Total number of test cases
- **Test Case Execution**: Number of tests executed per period
- **Defect Detection Rate**: Defects found per testing hour

### Product Metrics
- **Defect Escape Rate**: Defects found in production
- **Mean Time to Detection**: Time to find defects
- **Mean Time to Resolution**: Time to fix defects
- **Customer Reported Defects**: Defects reported by users
- **Test Coverage**: Code, feature, and requirement coverage

### Team Metrics
- **Test Case Productivity**: Test cases created per person-hour
- **Automation Productivity**: Automated tests created per person-hour
- **Defect Detection Efficiency**: Defects found per person-hour
- **Test Execution Efficiency**: Tests executed per person-hour

### Quality Metrics
- **Overall Quality Score**: Composite quality metric
- **Test Pass Rate**: Percentage of passing tests
- **Defect Density**: Defects per size metric
- **Code Quality Score**: Based on complexity, duplication, smells
- **Performance Score**: Based on response time, throughput, errors

### Metrics Dashboard
```
Quality Dashboard:
┌─────────────────────────────────────────┐
│ Overall Quality Score: 87/100          │
├─────────────────────────────────────────┤
│ Test Coverage: 85%                      │
│ ├─ Line: 87%                            │
│ ├─ Branch: 82%                          │
│ └─ Function: 90%                       │
├─────────────────────────────────────────┤
│ Code Quality: 82/100                    │
│ ├─ Complexity: 8.2 avg                  │
│ ├─ Duplication: 3.1%                    │
│ └─ Maintainability: 78                  │
├─────────────────────────────────────────┤
│ Defects: 12 open                        │
│ ├─ Critical: 1                          │
│ ├─ High: 3                              │
│ ├─ Medium: 5                            │
│ └─ Low: 3                               │
├─────────────────────────────────────────┤
│ Performance: 92/100                     │
│ ├─ p95 Response: 420ms                  │
│ ├─ Throughput: 1250 RPS                 │
│ └─ Error Rate: 0.05%                    │
└─────────────────────────────────────────┘
```

## Metrics Collection and Analysis

### Data Collection
- Automated collection from CI/CD pipelines
- Integration with test frameworks
- Real-time monitoring and alerts
- Historical data storage
- Data normalization and aggregation

### Analysis Techniques
- Trend analysis over time
- Comparison between branches/releases
- Correlation with code changes
- Root cause analysis of quality issues
- Predictive analytics for quality forecasting

### Reporting Frequency
- **Real-time**: Build status, test failures, critical defects
- **Daily**: Test execution, defect updates, performance metrics
- **Weekly**: Quality trends, coverage reports, team metrics
- **Monthly**: Quality scorecards, process improvements, strategic insights
- **Quarterly**: Quality reviews, goal setting, process optimization

### Continuous Improvement
- Identify quality trends and patterns
- Set quality goals and targets
- Track progress toward goals
- Implement process improvements based on metrics
- Celebrate quality achievements
