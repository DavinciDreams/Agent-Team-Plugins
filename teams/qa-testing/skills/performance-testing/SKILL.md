---
name: performance-testing
description: Performance testing methodologies, tools, and metrics
---

# Performance Testing

## Performance Testing Types

### Load Testing
**Purpose**: Verify system performance under expected load
- Simulates expected user traffic and data volume
- Identifies performance bottlenecks under normal conditions
- Establishes performance baselines
- Validates SLA compliance

**Key Metrics**:
- Response time (average, median, p95, p99)
- Throughput (requests per second, transactions per second)
- Error rate
- Resource utilization (CPU, memory, disk, network)

### Stress Testing
**Purpose**: Identify system breaking points
- Exceeds expected load to find limits
- Tests system recovery after failure
- Identifies failure modes and error handling
- Validates graceful degradation

**Key Metrics**:
- Maximum concurrent users before failure
- Maximum throughput before failure
- Time to recover after load reduction
- Error patterns and failure modes

### Spike Testing
**Purpose**: Handle sudden traffic increases
- Simulates sudden traffic spikes (e.g., flash sales, viral content)
- Tests system elasticity and auto-scaling
- Validates queuing and throttling mechanisms
- Identifies race conditions under load

**Key Metrics**:
- Response time during spike
- Error rate during spike
- Time to stabilize after spike
- Queue depth and processing time

### Soak Testing
**Purpose**: Verify stability over extended periods
- Runs sustained load for hours or days
- Identifies memory leaks and resource exhaustion
- Tests database connection pool stability
- Validates garbage collection efficiency

**Key Metrics**:
- Memory usage over time
- Response time trends
- Error rate over time
- Resource utilization trends

### Volume Testing
**Purpose**: Test with large data volumes
- Tests performance with realistic data sizes
- Identifies database query performance issues
- Tests file system and storage performance
- Validates data migration performance

**Key Metrics**:
- Query execution time with large datasets
- Index usage and effectiveness
- Storage I/O performance
- Data processing throughput

## Performance Testing Tools

### JMeter
**Best for**: Load and stress testing
- Open source, Java-based
- Supports multiple protocols (HTTP, JDBC, JMS, etc.)
- Distributed testing support
- Extensive plugin ecosystem
- GUI and CLI modes

```xml
<!-- JMeter Test Plan Example -->
<?xml version="1.0" encoding="UTF-8"?>
<jmeterTestPlan>
  <hashTree>
    <TestPlan guiclass="TestPlanGui">
      <stringProp name="TestPlan.comments">Load Test</stringProp>
    </TestPlan>
    <hashTree>
      <ThreadGroup guiclass="ThreadGroupGui">
        <stringProp name="ThreadGroup.num_threads">100</stringProp>
        <stringProp name="ThreadGroup.ramp_time">10</stringProp>
        <stringProp name="ThreadGroup.duration">60</stringProp>
      </ThreadGroup>
      <hashTree>
        <HTTPSamplerProxy guiclass="HttpTestSampleGui">
          <stringProp name="HTTPSampler.domain">example.com</stringProp>
          <stringProp name="HTTPSampler.path">/api/users</stringProp>
        </HTTPSamplerProxy>
      </hashTree>
    </hashTree>
  </hashTree>
</jmeterTestPlan>
```

### Gatling
**Best for**: High-performance load testing
- Scala-based, DSL for test scenarios
- High performance, low resource usage
- Real-time metrics and reporting
- Good for continuous integration
- Supports HTTP, WebSocket, JMS

```scala
// Gatling Example
import io.gatling.core.Predef._
import io.gatling.http.Predef._

class LoadTest extends Simulation {
  val httpProtocol = http.baseUrl("https://example.com")
  
  val scn = scenario("User Journey")
    .exec(http("Get Users").get("/api/users"))
    .pause(1)
    .exec(http("Get User").get("/api/users/1"))
  
  setUp(
    scn.inject(
      rampUsers(100).during(10.seconds),
      constantUsersPerSec(50).during(60.seconds)
    )
  ).protocols(httpProtocol)
}
```

### k6
**Best for**: Developer-friendly performance testing
- JavaScript-based, easy to learn
- Modern CLI and cloud integration
- Good for CI/CD pipelines
- Supports HTTP/1.1, HTTP/2, WebSocket
- Grafana integration for visualization

```javascript
// k6 Example
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '10s', target: 100 },
    { duration: '60s', target: 100 },
    { duration: '10s', target: 0 },
  ],
};

export default function () {
  let res = http.get('https://example.com/api/users');
  check(res, {
    'status was 200': (r) => r.status == 200,
    'response time < 500ms': (r) => r.timings.duration < 500,
  });
  sleep(1);
}
```

### Locust
**Best for**: Python-based load testing
- Python-based, easy to write tests
- Web UI for real-time monitoring
- Distributed testing support
- Good for complex user scenarios
- Event-based architecture

```python
# Locust Example
from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
    wait_time = between(1, 3)
    
    @task
    def get_users(self):
        self.client.get("/api/users")
    
    @task(2)
    def get_user(self):
        self.client.get("/api/users/1")
```

## Key Performance Metrics

### Response Time
- **Average**: Mean response time across all requests
- **Median**: Middle value, less affected by outliers
- **p95**: 95th percentile, 95% of requests complete within this time
- **p99**: 99th percentile, 99% of requests complete within this time
- **Min/Max**: Fastest and slowest response times

### Throughput
- **Requests Per Second (RPS)**: Number of requests handled per second
- **Transactions Per Second (TPS)**: Number of business transactions per second
- **Concurrent Users**: Number of simultaneous users
- **Hits Per Second**: Number of HTTP requests per second

### Error Rate
- **HTTP Error Rate**: Percentage of HTTP errors (4xx, 5xx)
- **Application Error Rate**: Percentage of application-level errors
- **Timeout Rate**: Percentage of requests that timed out
- **Connection Error Rate**: Percentage of connection failures

### Resource Utilization
- **CPU Usage**: Processor utilization percentage
- **Memory Usage**: RAM consumption and availability
- **Disk I/O**: Read/write operations and latency
- **Network I/O**: Bandwidth utilization and latency
- **Database Connections**: Active and idle connection counts

## Performance Profiling

### Application Profiling
- **CPU Profiling**: Identify CPU-intensive methods
- **Memory Profiling**: Detect memory leaks and allocation patterns
- **Thread Profiling**: Identify thread contention and deadlocks
- **Database Profiling**: Analyze query performance and execution plans

### Tools
- **Java**: JProfiler, VisualVM, YourKit
- **Node.js**: Node.js Profiler, Clinic.js
- **Python**: cProfile, Py-Spy
- **Go**: pprof
- **.NET**: dotTrace, Visual Studio Profiler

### Bottleneck Identification
1. **Database**: Slow queries, missing indexes, N+1 queries
2. **Network**: Latency, bandwidth limitations, connection pooling
3. **Application**: Inefficient algorithms, excessive object creation
4. **External Services**: Third-party API latency, rate limiting
5. **Caching**: Cache misses, stale data, cache stampede

## Performance Baselines and SLAs

### Establishing Baselines
- Run tests in production-like environment
- Collect metrics over multiple runs
- Account for normal variability
- Document test conditions and data
- Store baselines in version control

### SLA Definitions
- **Response Time SLAs**: Maximum acceptable response times
- **Availability SLAs**: Minimum uptime requirements (e.g., 99.9%)
- **Throughput SLAs**: Minimum requests per second
- **Error Rate SLAs**: Maximum acceptable error rate

### Example SLAs
```
API Response Times:
- p50 < 200ms
- p95 < 500ms
- p99 < 1000ms

Availability: 99.9% (8.76 hours downtime/year)

Error Rate: < 0.1%

Throughput: 1000 RPS
```

## Cloud-Based Performance Testing

### Cloud Testing Benefits
- Scalable infrastructure on demand
- Geographic distribution
- Realistic load simulation
- Pay-as-you-go pricing
- Integration with cloud services

### Cloud Testing Platforms
- **AWS**: EC2, Lambda, Fargate for distributed testing
- **Google Cloud**: Compute Engine, Cloud Functions
- **Azure**: Virtual Machines, Azure Functions
- **Managed Services**: BlazeMeter, LoadRunner Cloud, k6 Cloud

### Cloud Testing Best Practices
- Use multiple regions for geographic testing
- Leverage auto-scaling for flexible load
- Monitor cloud costs during testing
- Clean up resources after testing
- Use cloud-native monitoring and logging

## Performance Test Planning

### Test Scenarios
- Define realistic user journeys
- Identify critical paths
- Include happy path and edge cases
- Account for different user types
- Consider peak and off-peak patterns

### Load Models
- **Constant Load**: Steady user count over time
- **Ramp-up Load**: Gradually increase users
- **Spike Load**: Sudden increase in users
- **Step Load**: Incremental increases with plateaus
- **Random Load**: Variable user patterns

### Test Data
- Use realistic data volumes
- Include edge cases and boundary values
- Account for data distribution
- Refresh data between test runs
- Consider data privacy and security

### Environment Setup
- Mirror production configuration
- Use production-like data
- Monitor system resources
- Isolate test environment
- Document environment differences
