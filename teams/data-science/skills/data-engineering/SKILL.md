---
name: data-engineering
description: Data pipeline patterns, ETL/ELT best practices, data storage options, and data quality techniques
---

# Data Engineering

## Data Pipeline Patterns

### Batch Processing
- **Scheduled Jobs**: Run data processing at fixed intervals (hourly, daily, weekly)
- **Use Cases**: Historical analysis, reporting, data warehousing
- **Tools**: Apache Spark, Hadoop, Airflow, dbt
- **Design Considerations**: Latency tolerance, resource efficiency, cost optimization

### Streaming Processing
- **Real-time Ingestion**: Process data as it arrives with low latency
- **Use Cases**: Real-time analytics, monitoring, fraud detection
- **Tools**: Apache Kafka, Apache Flink, Apache Storm, Apache Beam
- **Design Considerations**: Event ordering, exactly-once semantics, backpressure

### Lambda Architecture
- **Batch Layer**: Store immutable master dataset, compute batch views
- **Speed Layer**: Process real-time data for low-latency queries
- **Serving Layer**: Merge batch and real-time views for queries
- **Use Cases**: Systems requiring both batch and real-time capabilities
- **Challenges**: Complexity of maintaining two code paths

### Kappa Architecture
- **Unified Processing**: Use a single stream processing framework
- **Replay Capability**: Reprocess data from the event log
- **Use Cases**: Simplified architecture when batch is just fast streaming
- **Benefits**: Reduced complexity, single codebase

## ETL/ELT Best Practices

### ETL (Extract, Transform, Load)
- **Extract**: Pull data from source systems with minimal impact
- **Transform**: Clean, validate, and transform data in a staging area
- **Load**: Load processed data into the target system
- **Best Practices**: 
  - Minimize source system impact
  - Handle incremental updates efficiently
  - Validate data before loading
  - Document transformation logic

### ELT (Extract, Load, Transform)
- **Extract**: Pull raw data from source systems
- **Load**: Load raw data into the target system (usually data warehouse)
- **Transform**: Transform data within the target system using SQL
- **Best Practices**:
  - Leverage data warehouse compute power
  - Maintain raw data for audit trails
  - Use dbt for transformation orchestration
  - Version control transformation logic

### Data Ingestion Patterns
- **Full Load**: Load entire dataset each time
- **Incremental Load**: Load only changed records
- **Change Data Capture (CDC)**: Capture data changes in real-time
- **Bulk Load**: High-volume batch loading for initial loads

## Data Storage Options

### SQL Databases
- **Relational Data**: Structured data with relationships
- **ACID Compliance**: Strong consistency guarantees
- **Examples**: PostgreSQL, MySQL, SQL Server, Oracle
- **Use Cases**: Transactional systems, operational data stores

### NoSQL Databases
- **Document Stores**: JSON-like documents (MongoDB, CouchDB)
- **Key-Value Stores**: Simple key-value pairs (Redis, DynamoDB)
- **Column-Family Stores**: Wide-column storage (Cassandra, HBase)
- **Graph Databases**: Relationship-focused (Neo4j, Amazon Neptune)
- **Use Cases**: Semi-structured data, high scalability, specific data models

### Data Lakes
- **Raw Data Storage**: Store data in native format
- **Schema-on-Read**: Define schema when reading data
- **Examples**: AWS S3, Azure Data Lake, Google Cloud Storage
- **Use Cases**: Data exploration, ML training, archiving

### Data Warehouses
- **Optimized for Analytics**: Columnar storage, compression
- **SQL Interface**: Familiar query language
- **Examples**: Snowflake, BigQuery, Redshift, Azure Synapse
- **Use Cases**: Business intelligence, reporting, analytics

## Data Quality and Validation

### Data Quality Dimensions
- **Completeness**: No missing values or records
- **Accuracy**: Data reflects real-world values
- **Consistency**: No conflicting data across sources
- **Timeliness**: Data is up-to-date
- **Validity**: Data conforms to defined rules and formats
- **Uniqueness**: No duplicate records

### Validation Techniques
- **Schema Validation**: Check data types, formats, and constraints
- **Range Checks**: Verify values fall within expected ranges
- **Pattern Matching**: Use regex for format validation (email, phone, etc.)
- **Referential Integrity**: Validate foreign key relationships
- **Business Rules**: Apply domain-specific validation logic

### Data Profiling
- **Statistical Analysis**: Understand data distributions and patterns
- **Pattern Discovery**: Identify data formats and structures
- **Anomaly Detection**: Find outliers and unusual values
- **Dependency Analysis**: Discover relationships between fields

### Data Lineage
- **Source Tracking**: Trace data back to original sources
- **Transformation Tracking**: Document all transformations applied
- **Impact Analysis**: Understand downstream effects of changes
- **Compliance**: Meet regulatory requirements for data tracking
