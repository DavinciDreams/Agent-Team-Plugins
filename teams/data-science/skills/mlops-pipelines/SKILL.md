---
name: mlops-pipelines
description: Model deployment strategies, monitoring and drift detection, CI/CD for ML models, feature store concepts, and model versioning
---

# MLOps Pipelines

## Model Deployment Strategies

### Batch Deployment
- **Description**: Run model on fixed schedule on accumulated data
- **Use Cases**: Credit scoring, churn prediction, recommendations
- **Advantages**: Simple, cost-effective, handles large volumes
- **Challenges**: Latency, stale predictions
- **Tools**: Apache Airflow, dbt, cron jobs, cloud batch services

### Real-time Deployment
- **Description**: Serve model as API for immediate predictions
- **Use Cases**: Fraud detection, dynamic pricing, personalization
- **Advantages**: Low latency, fresh predictions
- **Challenges**: Scalability, infrastructure complexity
- **Tools**: Flask, FastAPI, TensorFlow Serving, TorchServe, KServe

### Edge Deployment
- **Description**: Deploy model on edge devices (IoT, mobile, embedded)
- **Use Cases**: Computer vision, speech recognition, offline scenarios
- **Advantages**: Low latency, privacy, no internet required
- **Challenges**: Limited compute, model size constraints
- **Tools**: TensorFlow Lite, ONNX, Core ML, ML Kit

### Streaming Deployment
- **Description**: Process data streams with real-time predictions
- **Use Cases**: Real-time analytics, monitoring, anomaly detection
- **Advantages**: Continuous processing, low latency
- **Challenges**: State management, exactly-once semantics
- **Tools**: Apache Kafka, Apache Flink, Apache Spark Streaming

## Model Monitoring and Drift Detection

### Performance Monitoring
- **Prediction Metrics**: Track model outputs and distributions
- **Accuracy Metrics**: Monitor precision, recall, F1, MAE, RMSE
- **Business Metrics**: Connect predictions to business KPIs
- **Latency**: Track prediction response times
- **Throughput**: Monitor predictions per second

### Data Drift Detection
- **Covariate Drift**: Changes in input feature distribution
- **Prior Probability Drift**: Changes in target class distribution
- **Concept Drift**: Changes in relationship between features and target
- **Detection Methods**: Statistical tests, KL divergence, PSI
- **Visualization**: Feature distribution plots over time

### Drift Mitigation
- **Retraining Triggers**: Automatic retraining on drift detection
- **Ensemble Methods**: Combine multiple models for robustness
- **Online Learning**: Update model continuously with new data
- **Feature Monitoring**: Track feature distributions and correlations

### Alerting
- **Threshold-based Alerts**: Alert when metrics exceed thresholds
- **Anomaly Detection**: Detect unusual patterns automatically
- **Dashboard Monitoring**: Real-time dashboards for visibility
- **Incident Response**: Procedures for handling model failures

## CI/CD for ML Models

### ML Pipeline Stages
- **Data Ingestion**: Collect and validate training data
- **Feature Engineering**: Create and validate features
- **Model Training**: Train and validate models
- **Model Evaluation**: Evaluate model performance
- **Model Deployment**: Deploy model to production
- **Monitoring**: Monitor model performance and data drift

### Continuous Integration
- **Code Testing**: Unit tests, integration tests
- **Data Validation**: Validate data quality and schema
- **Model Testing**: Test model performance and behavior
- **Artifact Storage**: Store models, features, and metadata
- **Automated Builds**: Build and test on every commit

### Continuous Deployment
- **Automated Deployment**: Deploy models automatically after validation
- **Canary Releases**: Gradual rollout to subset of users
- **A/B Testing**: Compare model versions in production
- **Rollback**: Quick rollback to previous version if issues occur
- **Blue-Green Deployment**: Switch between production environments

### MLOps Platforms
- **MLflow**: Open-source ML lifecycle platform
- **Kubeflow**: Kubernetes-native ML platform
- **Vertex AI**: Google Cloud ML platform
- **SageMaker**: AWS ML platform
- **Azure ML**: Microsoft Azure ML platform

## Feature Store Concepts

### Feature Store Benefits
- **Feature Reusability**: Share features across models and teams
- **Consistency**: Ensure consistent feature computation
- **Latency**: Low-latency feature serving for real-time predictions
- **Versioning**: Track feature versions and lineage
- **Governance**: Control feature access and permissions

### Feature Types
- **Batch Features**: Computed from batch data (e.g., daily aggregates)
- **Streaming Features**: Computed from streaming data (e.g., real-time counts)
- **On-demand Features**: Computed at request time (e.g., time since last event)
- **Derived Features**: Combinations of other features

### Feature Store Architecture
- **Offline Store**: Store historical features for training
- **Online Store**: Low-latency serving for inference
- **Feature Registry**: Catalog of available features
- **Feature Monitoring**: Track feature quality and drift

### Feature Store Tools
- **Feast**: Open-source feature store
- **Tecton**: Enterprise feature store platform
- **Hopsworks**: Open-source feature store
- **AWS Feature Store**: AWS feature store service
- **Azure Feature Store**: Azure feature store service

## Model Versioning and Registry

### Model Versioning
- **Version Numbers**: Semantic versioning for models
- **Metadata**: Track training data, hyperparameters, metrics
- **Artifacts**: Store model files, weights, configurations
- **Lineage**: Track model provenance and dependencies
- **Tags**: Label models for easy identification

### Model Registry
- **Central Repository**: Store all model versions
- **Model Promotion**: Promote models through stages (dev, staging, prod)
- **Access Control**: Control who can deploy models
- **Model Search**: Find models by metadata or tags
- **Model Documentation**: Document model purpose and behavior

### Model Artifacts
- **Model Files**: Saved model weights and architecture
- **Configuration Files**: Model hyperparameters and settings
- **Training Code**: Code used to train the model
- **Evaluation Results**: Model performance metrics
- **Deployment Artifacts**: Docker images, serving configurations

### Model Lifecycle
- **Development**: Initial model development and experimentation
- **Staging**: Test model in staging environment
- **Production**: Deploy model to production
- **Retired**: Decommission model when no longer needed
- **Archived**: Store model for historical reference

### Best Practices
- **Reproducibility**: Ensure models can be reproduced
- **Documentation**: Document model purpose, behavior, and limitations
- **Testing**: Test models thoroughly before deployment
- **Monitoring**: Monitor model performance in production
- **Governance**: Establish approval processes for model deployment
