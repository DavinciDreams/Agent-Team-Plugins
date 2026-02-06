---
name: statistical-analysis
description: Statistical methods and tests, hypothesis testing, A/B testing frameworks, time series analysis, and experimental design
---

# Statistical Analysis

## Statistical Methods and Tests

### Descriptive Statistics
- **Measures of Central Tendency**: Mean, median, mode
- **Measures of Dispersion**: Variance, standard deviation, range, interquartile range
- **Distribution Shape**: Skewness, kurtosis
- **Correlation**: Pearson, Spearman, Kendall correlation coefficients
- **Covariance**: Measure of joint variability

### Probability Distributions
- **Normal Distribution**: Bell curve, symmetric, defined by mean and standard deviation
- **Binomial Distribution**: Number of successes in n independent trials
- **Poisson Distribution**: Number of events in fixed interval
- **Exponential Distribution**: Time between events in Poisson process
- **Chi-Square Distribution**: Sum of squared normal variables

### Inferential Statistics
- **Confidence Intervals**: Range of values likely to contain population parameter
- **Hypothesis Testing**: Formal procedure for testing claims about populations
- **p-values**: Probability of observing results as extreme as current, assuming null hypothesis
- **Statistical Power**: Probability of correctly rejecting false null hypothesis
- **Effect Size**: Magnitude of difference or relationship

## Hypothesis Testing

### Hypothesis Structure
- **Null Hypothesis (H0)**: Default assumption, no effect or difference
- **Alternative Hypothesis (H1)**: Claim to be tested, effect or difference exists
- **Type I Error**: Rejecting true null hypothesis (false positive)
- **Type II Error**: Failing to reject false null hypothesis (false negative)
- **Significance Level (α)**: Threshold for rejecting null hypothesis (typically 0.05)

### Common Statistical Tests
- **t-test**: Compare means between two groups
  - One-sample t-test: Compare sample mean to known value
  - Independent t-test: Compare means of two independent groups
  - Paired t-test: Compare means of paired samples
- **ANOVA**: Compare means across multiple groups
  - One-way ANOVA: Single factor
  - Two-way ANOVA: Two factors with interaction
- **Chi-Square Test**: Test independence between categorical variables
- **Mann-Whitney U Test**: Non-parametric alternative to t-test
- **Kruskal-Wallis Test**: Non-parametric alternative to ANOVA

### Multiple Testing Correction
- **Bonferroni Correction**: Divide α by number of tests
- **False Discovery Rate (FDR)**: Control proportion of false positives
- **Benjamini-Hochberg**: Adaptive FDR control

## A/B Testing Frameworks

### Experimental Design
- **Control Group**: Receives current version or no treatment
- **Treatment Group**: Receives new version or treatment
- **Random Assignment**: Randomly assign subjects to groups
- **Sample Size Calculation**: Determine required sample size for desired power
- **Stratification**: Balance groups on important covariates

### Metrics Selection
- **Primary Metric**: Main measure of success
- **Secondary Metrics**: Additional measures of interest
- **Guardrail Metrics**: Ensure no negative impact on important KPIs
- **Binary Metrics**: Conversion, click-through rate
- **Continuous Metrics**: Revenue, time on page

### Statistical Significance
- **Two-tailed Test**: Test for difference in either direction
- **One-tailed Test**: Test for difference in specific direction
- **Confidence Intervals**: Provide range of plausible values
- **Minimum Detectable Effect (MDE)**: Smallest effect detectable with given power

### Common Pitfalls
- **Peeking**: Checking results before experiment ends
- **Simpson's Paradox**: Trend appears in groups but disappears when combined
- **Novelty Effect**: Temporary effect due to newness
- **Selection Bias**: Non-random assignment to groups

## Time Series Analysis

### Time Series Components
- **Trend**: Long-term increase or decrease
- **Seasonality**: Regular, predictable patterns
- **Cyclical**: Irregular, long-term cycles
- **Irregular/Noise**: Random fluctuations

### Stationarity
- **Definition**: Statistical properties constant over time
- **Tests**: Augmented Dickey-Fuller (ADF), KPSS test
- **Transformations**: Differencing, log transformation
- **Importance**: Required for many time series models

### Forecasting Methods
- **Naive Forecast**: Use last observed value
- **Moving Average**: Average of last n values
- **Exponential Smoothing**: Weighted average with decreasing weights
- **ARIMA**: AutoRegressive Integrated Moving Average
- **Prophet**: Facebook's forecasting tool for business time series
- **Neural Networks**: LSTM, GRU for complex patterns

### Seasonal Decomposition
- **Additive Model**: Y = Trend + Seasonal + Residual
- **Multiplicative Model**: Y = Trend × Seasonal × Residual
- **STL Decomposition**: Seasonal-Trend decomposition using LOESS

## Experimental Design

### Design Principles
- **Randomization**: Random assignment to treatment groups
- **Replication**: Repeat experiment multiple times
- **Blocking**: Group similar experimental units together
- **Factorial Design**: Test multiple factors simultaneously
- **Control Groups**: Baseline for comparison

### Sample Size Determination
- **Power Analysis**: Calculate required sample size
- **Effect Size**: Expected magnitude of effect
- **Significance Level**: Acceptable Type I error rate
- **Power**: Desired probability of detecting effect (typically 0.8)

### Experimental Validity
- **Internal Validity**: Causal relationship between treatment and outcome
- **External Validity**: Generalizability to other populations/settings
- **Construct Validity**: Measurement accurately reflects concept
- **Statistical Conclusion Validity**: Appropriate statistical methods

### Common Designs
- **Completely Randomized Design**: Random assignment to groups
- **Randomized Block Design**: Block on nuisance variables
- **Factorial Design**: Multiple factors with all combinations
- **Crossover Design**: Subjects receive multiple treatments
- **Split-Plot Design**: Hierarchical randomization
