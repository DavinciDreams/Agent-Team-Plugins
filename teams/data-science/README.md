# data-science

Data science and machine learning team with data explorer, data engineer, ML engineer, MLOps engineer, and data analyst agents that collaborate through phased workflows.

## Team Members

| Agent | Role | Model | Phase | Color |
|-------|------|-------|-------|-------|
| data-explorer | Data Explorer | sonnet | discovery | yellow |
| data-engineer | Data Engineer | sonnet | execution | green |
| ml-engineer | ML Engineer | sonnet | execution | cyan |
| mlops-engineer | MLOps Engineer | sonnet | execution | magenta |
| data-analyst | Data Analyst | sonnet | review | red |

## Usage

Activate the data-science team:

```
/data-science:datascience Build a churn prediction model using customer transaction data
```

Check team status:

```
/data-science:status
```

## Workflow

### Data Analysis (5 phases)

1. **Discovery** - Data explorer analyzes data structure, quality, and patterns
2. **Planning** - Design analysis approach, ask clarifying questions, get user approval
3. **Execution** - Data engineer, ML engineer, and MLOps engineer work in parallel
4. **Review** - Data analyst validates statistical validity and interpretations
5. **Summary** - Document findings and provide recommendations

### Model Development (5 phases)

1. **Discovery** - Understand data and ML problem requirements
2. **Planning** - Outline model architecture and training strategy
3. **Execution** - Build pipelines, train models, and set up deployment
4. **Review** - Validate model performance and statistical soundness
5. **Summary** - Final model artifacts and deployment recommendations

### Pipeline Development (5 phases)

1. **Discovery** - Analyze data sources and pipeline requirements
2. **Planning** - Design pipeline architecture and ETL processes
3. **Execution** - Implement data infrastructure and monitoring
4. **Review** - Validate pipeline quality and performance
5. **Summary** - Production-ready pipeline and documentation

### Optimization (3 phases)

1. **Discovery** - Identify optimization opportunities
2. **Execution** - Implement improvements
3. **Review** - Validate performance gains

## Skills

- **data-engineering** - Data pipeline patterns, ETL/ELT best practices, data storage options, data quality techniques
- **ml-best-practices** - Model selection guidelines, feature engineering techniques, hyperparameter tuning strategies, evaluation metrics, common ML frameworks
- **statistical-analysis** - Statistical methods and tests, hypothesis testing, A/B testing frameworks, time series analysis, experimental design
- **mlops-pipelines** - Model deployment strategies, monitoring and drift detection, CI/CD for ML models, feature store concepts, model versioning

## Telemetry

Tool usage is logged to `~/.claude/team-logs/data-science.jsonl` for observability.
