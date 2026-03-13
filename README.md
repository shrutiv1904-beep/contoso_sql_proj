# Intermediate SQL - Sales Analysis

## Overview
Analysis of customer behaviour, retention and lifetime value for an e-commerce company to improve customer retention and maximize revenue.

## Business Questions
1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Which customer haven't purchased recently

## Analysis Approach

### 1. Customer Segmentation Analysis
- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics: total revenue

🖥️ Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

**📈 Visualization**

![cohort_analysis](/images/cohort_analysis.png)

📊 **Key Findings:**

- High-value segment (25% of customers) drives 66% of revenue($135.4M)
- Mid-value segment (50% of customers) generates 32% of revenue ($66.6M)
- Low-value segment (25% of customers) accounts for 2% of revenue ($4.3M)

💡 **Business Insights:**

- High-value (66% revenue): Offer premium membership program to 12,372 VIP customers, as losing one customer significantly impacts revenue
- Mid-value (32% revenue): Create upgrade path through personalized promotions with potential $66.6M to $135.4M revenue oppurtunity
- Low-value (2% revenue): Design re-engagement campaigns and price sensitive promotions to increase purchase frequency 

### 2. Cohort Analysis
- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analysed customer retention at cohort level

🖥️ Query: [2_cohort_analysis.sql](/2_cohort_analysis.sql)

**📈 Visualization**

![Cohort Analysis](/images/cohort_analysis.png)

📊 **Key Findings:**

- Revenue per customer shows an alarming decreasing trend over time

    - 2022 - 2024 cohorts are conistently performing worse than earlier cohorts
    - NOTE: Although net revenue is increasing, thisis due to a larger customer base, which is not reflective of customer value

💡 **Business Insights:**

- Value extracted from customers is decreasing over time and needs further investigation.
- In 2023 we saw a drop in number of customers aquired, which is concerning.
- With both lowering LTV and decreasing customer acquisition, the company is facing a potential revenue decline.

### 3. Customer Retention

- Identified customers at the risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics

🖥️ Query: [3_customer_retention.sql](/3_retention_analysis.sql)

**📈 Visualization**

![customer_retention](/images/customer_retention.jpeg)

📊 **Key Findings:**

- Cohort churn stabilizes at ~90% after 2-3 years, indicating a predictable long-term retention pattern.
- Retention rates are consistently low (8-10%) across all the cohorts, suggesting retention issues are systematic rather than specific to certain years.
- Newer cohorts (2022-2023) shows similar churn trajectories, signaling that without intervation, future cohorts will follow the same pattern

💡 **Business Insights:**

- Strengthen early engagement strategies to target the first 1-2 years with onboarding incentives, loyalty rewards, and personalized offers to improve long-term retention
- Re-engage high value churned customers by focusing on targeted win-back campaigns rather than broad retention efforts as reactivating valuable users may yield higher ROI.
- Predict churn risks and use customer-specific warning indicators to proactively intervene with at-risk users before they lapse 

## Strategic Recommendations

1. **Customer Value Optimization (Customer Segmentation)**

    - Launch VIP programs for 12,372 high-value customers (66% revenue)
    - Create personalized upgrade paths for mid-value segments ($66.6M to $135.4M oppurtunity)
    - Design price-sensitive promotions for low-value segments to increase purchase frequency

2. **Cohort Performane Strategy (Customer Revenue by Cohort)**

    - Target 2022-2024 cohorts with personalized re-engagement offers
    - Implement loyalty/subscription programs to stabilize revenue fluctuations
    - Apply successful strategies from high spending 2016-2018 cohorts to newer customers

3. **Retention & Churn Prevention (Customer Retention)**

    - Strengthen the first 1-2 years engagement with onboarding incentives and loyalty rewards 
    - Focus on targeted win-back campaigns for high-value churned customers 
    - Implement proactive intervention system for at-risk customers before they lapse.

## Technical Details
- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL, DBeaver, PGadmin
- **Visualization:** ChatGPT 
