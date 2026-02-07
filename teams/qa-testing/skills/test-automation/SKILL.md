---
name: test-automation
description: Test automation strategies and best practices
---

# Test Automation

## Test Automation Strategies

### Pyramid Approach
- **Unit Tests (70%)**: Fast, isolated tests for individual functions and methods
- **Integration Tests (20%)**: Tests that verify components work together
- **End-to-End Tests (10%)**: Tests that simulate real user flows through the application

### Risk-Based Testing
- Prioritize automation based on business risk and frequency of use
- Focus on critical paths and high-value features first
- Automate regression tests to prevent regressions

### Test Data Management
- **Fixtures**: Pre-defined test data sets for consistent test runs
- **Factories**: Dynamic test data generation for flexibility
- **Test Builders**: Fluent APIs for creating complex test objects
- **Data Seeding**: Database seeding for integration and E2E tests

## Test Design Patterns

### Page Object Model (POM)
- Encapsulate page elements and interactions in page objects
- Separate test logic from page interaction logic
- Improve test maintainability and reusability
- Example structure:
  ```javascript
  class LoginPage {
    constructor(page) {
      this.page = page;
      this.usernameInput = page.locator('#username');
      this.passwordInput = page.locator('#password');
      this.loginButton = page.locator('#login');
    }
    
    async login(username, password) {
      await this.usernameInput.fill(username);
      await this.passwordInput.fill(password);
      await this.loginButton.click();
    }
  }
  ```

### Screenplay Pattern
- Actor-based testing with human-like interactions
- Composable abilities and tasks
- More readable and maintainable test scenarios
- Example structure:
  ```javascript
  actor.attemptsTo(
    Navigate.to('/login'),
    Enter.theValue('username').into('#username'),
    Enter.theValue('password').into('#password'),
    Click.on('#login')
  );
  ```

### Data-Driven Testing
- Separate test logic from test data
- Run same test with multiple data sets
- Use CSV, JSON, or database for test data
- Example structure:
  ```javascript
  const testData = [
    { username: 'user1', password: 'pass1', expected: 'success' },
    { username: 'user2', password: 'pass2', expected: 'success' },
    { username: 'invalid', password: 'wrong', expected: 'failure' }
  ];
  
  testData.forEach(({ username, password, expected }) => {
    test(`login with ${username}`, async ({ page }) => {
      await login(page, username, password);
      await expect(page.locator('.status')).toHaveText(expected);
    });
  });
  ```

## Mocking and Stubbing Techniques

### When to Mock
- External API calls
- Database operations
- File system operations
- Time-dependent code
- Random number generation

### Mocking Best Practices
- Mock at boundaries, not within the system under test
- Keep mocks simple and realistic
- Verify mock interactions when necessary
- Use test doubles appropriately (stub, mock, spy, fake)

### Example Mocking (Jest)
```javascript
jest.mock('./api');
import { fetchUser } from './api';

test('fetches user data', async () => {
  fetchUser.mockResolvedValue({ id: 1, name: 'Test User' });
  
  const result = await getUser(1);
  expect(result).toEqual({ id: 1, name: 'Test User' });
  expect(fetchUser).toHaveBeenCalledWith(1);
});
```

## Test Isolation

### Preventing Test Interference
- Use fresh test data for each test
- Clean up after each test (teardown)
- Avoid shared state between tests
- Use test databases or transactions

### Database Isolation
- Wrap tests in database transactions and rollback
- Use in-memory databases for faster tests
- Seed test data before each test
- Clean up test data after each test

## Flaky Test Prevention

### Common Causes
- Race conditions and timing issues
- Dependency on external services
- Non-deterministic test data
- Browser state pollution
- Parallel test execution conflicts

### Prevention Strategies
- Use explicit waits instead of implicit waits
- Mock external dependencies
- Use deterministic test data
- Clear browser state between tests
- Configure tests to run sequentially when needed
- Retry flaky tests with proper investigation

## Test Reporting and Visualization

### Reporting Tools
- **Allure**: Comprehensive test reporting with history and trends
- **Mochawesome**: HTML reports for Mocha tests
- **Jest HTML Reporters**: Visual reports for Jest test suites
- **JUnit XML**: Standard format for CI/CD integration

### Key Metrics to Track
- Test execution time
- Pass/fail rates
- Flaky test rate
- Coverage trends
- Test failure patterns

### Dashboard Elements
- Overall test health
- Coverage metrics
- Test execution trends
- Flaky test alerts
- Failure analysis by category
