---
name: test-frameworks
description: Testing frameworks for web, mobile, API, and unit testing
---

# Testing Frameworks

## Web Testing Frameworks

### Selenium
**Best for**: Cross-browser testing, legacy applications
- Supports multiple languages (Java, Python, JavaScript, C#)
- Wide browser support including legacy browsers
- Large community and extensive documentation
- Steeper learning curve
- Slower execution compared to modern frameworks

```java
// Java Selenium example
WebDriver driver = new ChromeDriver();
driver.get("https://example.com");
WebElement element = driver.findElement(By.id("username"));
element.sendKeys("testuser");
driver.quit();
```

### Cypress
**Best for**: Modern web applications, fast feedback
- JavaScript/TypeScript native
- Real-time reloads and debugging
- Automatic waiting and retries
- Network traffic control and stubbing
- Excellent developer experience
- Limited to JavaScript-based applications

```javascript
// Cypress example
describe('Login', () => {
  it('should login successfully', () => {
    cy.visit('/login');
    cy.get('#username').type('testuser');
    cy.get('#password').type('password');
    cy.get('#login').click();
    cy.url().should('include', '/dashboard');
  });
});
```

### Playwright
**Best for**: Modern web applications, cross-browser testing
- Multi-language support (JavaScript, Python, Java, .NET)
- Fast, reliable, and cross-browser
- Auto-waiting for elements
- Network interception and mocking
- Parallel test execution
- Headless and headed execution

```javascript
// Playwright JavaScript example
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('https://example.com');
  await page.fill('#username', 'testuser');
  await page.click('#login');
  await browser.close();
})();
```

### Puppeteer
**Best for**: Chrome/Chromium testing, scraping
- Chrome DevTools Protocol integration
- Headless browser automation
- Fast execution
- JavaScript/TypeScript native
- Chrome/Chromium only

```javascript
// Puppeteer example
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://example.com');
  await page.type('#username', 'testuser');
  await page.click('#login');
  await browser.close();
})();
```

## JavaScript Testing Frameworks

### Jest
**Best for**: React, Node.js, general JavaScript testing
- Zero configuration setup
- Built-in assertions and mocking
- Snapshot testing
- Parallel test execution
- Code coverage reporting

```javascript
// Jest example
describe('Calculator', () => {
  test('adds 1 + 2 to equal 3', () => {
    expect(add(1, 2)).toBe(3);
  });
  
  test('async operation', async () => {
    const result = await fetchData();
    expect(result).toEqual({ data: 'test' });
  });
});
```

### Mocha
**Best for**: Flexible testing needs, Node.js
- Flexible and extensible
- Async testing support
- Rich ecosystem of plugins
- Requires assertion library (Chai, Expect)
- Requires mocking library (Sinon)

```javascript
// Mocha example with Chai
const { expect } = require('chai');
const sinon = require('sinon');

describe('UserService', () => {
  it('should return user data', async () => {
    const user = await userService.getUser(1);
    expect(user).to.have.property('id', 1);
  });
});
```

### Vitest
**Best for**: Vite projects, fast modern testing
- Vite-native, extremely fast
- Jest-compatible API
- ESM support out of the box
- TypeScript support
- Watch mode with HMR

```javascript
// Vitest example
import { describe, it, expect } from 'vitest';

describe('Math', () => {
  it('should add numbers', () => {
    expect(add(1, 2)).toBe(3);
  });
});
```

### Jasmine
**Best for**: Traditional JavaScript testing
- Behavior-driven development
- No external dependencies
- Simple syntax
- Good for legacy projects

```javascript
// Jasmine example
describe('Calculator', () => {
  it('should add numbers', () => {
    const result = add(1, 2);
    expect(result).toBe(3);
  });
});
```

## Python Testing Frameworks

### pytest
**Best for**: Python applications, flexible testing
- Simple and intuitive syntax
- Powerful fixtures
- Plugin ecosystem
- Parallel test execution
- Code coverage integration

```python
# pytest example
def test_addition():
    assert add(1, 2) == 3

@pytest.fixture
def user_data():
    return {'id': 1, 'name': 'Test User'}

def test_user(user_data):
    assert user_data['name'] == 'Test User'
```

### unittest
**Best for**: Standard library, traditional testing
- Built into Python
- xUnit-style testing
- Test discovery
- Mock library included

```python
# unittest example
import unittest

class TestCalculator(unittest.TestCase):
    def test_addition(self):
        result = add(1, 2)
        self.assertEqual(result, 3)
```

### nose2
**Best for**: Extending unittest
- Extends unittest
- Plugin system
- Test discovery
- Parallel execution

## Java Testing Frameworks

### JUnit
**Best for**: Java applications, standard testing
- Industry standard
- Annotations-based
- Test runners
- Parameterized tests
- Integration with build tools

```java
// JUnit 5 example
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {
    @Test
    void testAddition() {
        assertEquals(3, add(1, 2));
    }
}
```

### TestNG
**Best for**: Advanced testing needs
- More features than JUnit
- Parallel execution
- Data-driven testing
- XML configuration
- Integration with Selenium

```java
// TestNG example
import org.testng.annotations.Test;
import static org.testng.Assert.*;

public class CalculatorTest {
    @Test
    public void testAddition() {
        assertEquals(add(1, 2), 3);
    }
}
```

### Mockito
**Best for**: Mocking in Java
- Clean mocking API
- Verification of interactions
- Stubbing behavior
- Integration with JUnit/TestNG

```java
// Mockito example
import static org.mockito.Mockito.*;

List<String> mockList = mock(List.class);
when(mockList.get(0)).thenReturn("first");
assertEquals("first", mockList.get(0));
verify(mockList).get(0);
```

## Mobile Testing Frameworks

### Appium
**Best for**: Cross-platform mobile testing
- Supports iOS and Android
- Uses WebDriver protocol
- Multiple language support
- Native, hybrid, and mobile web apps

```java
// Appium Java example
AppiumDriver driver = new AndroidDriver(new URL("http://localhost:4723/wd/hub"), capabilities);
driver.findElement(By.id("username")).sendKeys("testuser");
driver.quit();
```

### Espresso
**Best for**: Android native testing
- Android native
- Fast and reliable
- Synchronized with UI thread
- Google-supported

```java
// Espresso example
onView(withId(R.id.username))
    .perform(typeText("testuser"))
    .check(matches(withText("testuser")));
```

### XCUITest
**Best for**: iOS native testing
- Apple native
- Swift/Objective-C
- Fast execution
- Xcode integration

```swift
// XCUITest example
let app = XCUIApplication()
app.textFields["username"].tap()
app.textFields["username"].typeText("testuser")
```

## API Testing Frameworks

### Postman
**Best for**: Manual and automated API testing
- User-friendly interface
- Collections and environments
- Test scripts
- CI/CD integration
- Mock servers

```javascript
// Postman test script
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has data", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.data).to.exist;
});
```

### REST Assured
**Best for**: Java API testing
- Fluent API
- JSON/XML support
- Authentication support
- Integration with JUnit/TestNG

```java
// REST Assured example
given()
    .header("Content-Type", "application/json")
    .body("{\"name\":\"test\"}")
.when()
    .post("/api/users")
.then()
    .statusCode(201)
    .body("name", equalTo("test"));
```

### Supertest
**Best for**: Node.js API testing
- Express integration
- Chai assertions
- Easy to use
- Good for testing Express apps

```javascript
// Supertest example
const request = require('supertest');
const app = require('./app');

describe('API', () => {
  it('should create user', async () => {
    const res = await request(app)
      .post('/api/users')
      .send({ name: 'test' })
      .expect(201);
    expect(res.body.name).toBe('test');
  });
});
```

## Framework Selection Guidelines

### Web Testing
- **Modern JavaScript apps**: Cypress or Playwright
- **Cross-browser needs**: Playwright or Selenium
- **Chrome-only**: Puppeteer
- **Legacy apps**: Selenium

### Unit Testing
- **JavaScript**: Jest or Vitest
- **Python**: pytest
- **Java**: JUnit 5
- **.NET**: xUnit or NUnit

### Mobile Testing
- **Cross-platform**: Appium
- **Android only**: Espresso
- **iOS only**: XCUITest

### API Testing
- **Java**: REST Assured
- **Node.js**: Supertest
- **Manual/Exploratory**: Postman
