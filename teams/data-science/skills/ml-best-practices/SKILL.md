---
name: ml-best-practices
description: Model selection guidelines, feature engineering techniques, hyperparameter tuning strategies, evaluation metrics, and common ML frameworks
---

# ML Best Practices

## Model Selection Guidelines

### Problem Type Classification
- **Supervised Learning**: Labeled data for training
  - Regression: Predict continuous values (Linear Regression, Random Forest, Gradient Boosting)
  - Classification: Predict discrete labels (Logistic Regression, SVM, Decision Trees, Neural Networks)
- **Unsupervised Learning**: Unlabeled data exploration
  - Clustering: Group similar data points (K-Means, DBSCAN, Hierarchical)
  - Dimensionality Reduction: Reduce feature space (PCA, t-SNE, UMAP)
  - Anomaly Detection: Identify outliers (Isolation Forest, One-Class SVM)
- **Reinforcement Learning**: Learn through interaction with environment
  - Policy-based: Learn policy directly (REINFORCE, PPO)
  - Value-based: Learn value function (DQN, SARSA)

### Algorithm Selection Criteria
- **Data Size**: Small vs. large datasets
- **Feature Types**: Numerical, categorical, text, image
- **Interpretability**: Need for model explanations
- **Training Time**: Constraints on model training
- **Inference Latency**: Real-time vs. batch predictions
- **Accuracy Requirements**: Trade-offs with complexity

### Common ML Frameworks
- **scikit-learn**: Traditional ML algorithms, easy to use
- **TensorFlow/Keras**: Deep learning, production-ready
- **PyTorch**: Research-friendly, dynamic computation graphs
- **XGBoost/LightGBM**: Gradient boosting for tabular data
- **Hugging Face Transformers**: Pre-trained NLP models

## Feature Engineering Techniques

### Numerical Features
- **Scaling**: Standardization (z-score) or Min-Max scaling
- **Binning**: Convert continuous to categorical
- **Polynomial Features**: Create interaction terms
- **Log Transformations**: Handle skewed distributions
- **Normalization**: Scale to unit norm

### Categorical Features
- **One-Hot Encoding**: Binary columns for each category
- **Label Encoding**: Map categories to integers
- **Ordinal Encoding**: Preserve order for ordinal categories
- **Target Encoding**: Replace with target mean (with regularization)
- **Embedding**: Learn dense representations (for high cardinality)

### Text Features
- **Bag of Words**: Word frequency counts
- **TF-IDF**: Term frequency-inverse document frequency
- **N-grams**: Capture word sequences
- **Word Embeddings**: Pre-trained (Word2Vec, GloVe) or learned
- **Transformer Embeddings**: Contextual embeddings (BERT, RoBERTa)

### Feature Selection
- **Filter Methods**: Statistical tests, correlation analysis
- **Wrapper Methods**: Recursive feature elimination, forward/backward selection
- **Embedded Methods**: L1 regularization, tree-based feature importance
- **Dimensionality Reduction**: PCA, LDA, autoencoders

## Hyperparameter Tuning Strategies

### Search Strategies
- **Grid Search**: Exhaustive search over parameter grid
- **Random Search**: Random sampling from parameter space
- **Bayesian Optimization**: Use probabilistic model to guide search
- **Evolutionary Algorithms**: Genetic algorithms for parameter evolution
- **Successive Halving**: Early stopping for poor configurations

### Common Hyperparameters
- **Tree-based Models**: max_depth, n_estimators, learning_rate, min_samples_split
- **Neural Networks**: learning_rate, batch_size, number of layers, number of units
- **SVM**: C, kernel, gamma
- **K-Means**: n_clusters, init, n_init

### Tuning Best Practices
- **Cross-Validation**: Use k-fold or stratified k-fold for robust evaluation
- **Early Stopping**: Stop training when validation performance degrades
- **Learning Rate Schedules**: Decay learning rate over time
- **Ensembling**: Combine multiple models for better performance

## Evaluation Metrics and Validation Methods

### Regression Metrics
- **Mean Squared Error (MSE)**: Average of squared errors
- **Root Mean Squared Error (RMSE)**: Square root of MSE
- **Mean Absolute Error (MAE)**: Average of absolute errors
- **R-squared**: Proportion of variance explained
- **Mean Absolute Percentage Error (MAPE)**: Percentage-based error

### Classification Metrics
- **Accuracy**: Overall correct predictions
- **Precision**: True positives / (true positives + false positives)
- **Recall**: True positives / (true positives + false negatives)
- **F1-Score**: Harmonic mean of precision and recall
- **ROC-AUC**: Area under ROC curve
- **Confusion Matrix**: Detailed breakdown of predictions

### Validation Methods
- **Train-Test Split**: Simple holdout validation
- **K-Fold Cross-Validation**: Divide data into k folds
- **Stratified K-Fold**: Preserve class distribution in folds
- **Time Series Split**: Respect temporal order
- **Nested Cross-Validation**: Outer loop for evaluation, inner for tuning

### Bias-Variance Trade-off
- **High Bias**: Underfitting, model too simple
- **High Variance**: Overfitting, model too complex
- **Sweet Spot**: Balance between bias and variance
- **Regularization**: Reduce variance by adding constraints

## Model Interpretation

### Feature Importance
- **Permutation Importance**: Shuffle feature values and measure impact
- **SHAP Values**: Game-theoretic approach to feature attribution
- **LIME**: Local interpretable model-agnostic explanations
- **Partial Dependence Plots**: Show relationship between feature and predictions

### Model-Agnostic Methods
- **SHAP**: Consistent, local feature attribution
- **LIME**: Local linear approximations
- **Permutation Importance**: Global feature importance
- **Partial Dependence**: Global relationship visualization

### Model-Specific Methods
- **Linear Models**: Coefficients directly show feature impact
- **Tree-based Models**: Feature importance from split criteria
- **Neural Networks**: Attention weights, saliency maps
