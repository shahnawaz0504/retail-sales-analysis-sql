# Retail Sales Data Analysis

## Overview
This project provides a comprehensive analysis of retail sales data using SQL. The analysis focuses on understanding sales patterns, customer behavior, and business performance across different categories, time periods, and customer segments.

## Dataset Information
- **Database**: `retail_sales`
- **Main Table**: `sales`
- **Time Period**: 2022 (primarily November data)
- **Categories**: Clothing, Beauty, and other retail categories
- **Records**: Complete transaction-level data with customer demographics

### Database Schema
The `sales` table contains the following columns:
- `transaction_id`: Unique identifier for each transaction
- `sale_date`: Date of the sale (DATE format)
- `sale_time`: Time of the sale
- `customer_id`: Unique customer identifier
- `gender`: Customer gender
- `age`: Customer age
- `category`: Product category
- `quantity`: Number of items sold
- `price_per_unit`: Price per individual item
- `cogs`: Cost of goods sold
- `total_sale`: Total transaction amount

## Analysis Objectives
1. **Data Quality Assessment**: Clean and validate the retail sales dataset
2. **Sales Performance**: Analyze total sales by category and identify trends
3. **Customer Segmentation**: Understand customer demographics and purchasing behavior
4. **Time-based Analysis**: Identify peak sales periods and seasonal patterns
5. **Operational Insights**: Analyze sales performance by time shifts

## File Structure
```
├── README.md
├── retail_sales_analysis.sql    # Main analysis script
└── retail_sales            # Database tables
```

## Key Queries and Analysis

### Data Cleaning & Preparation
- **Column Renaming**: Fixed encoding issues with `transaction_id` column
- **Data Type Conversion**: Converted `sale_date` to proper DATE format
- **Quantity Column Fix**: Corrected typo in `quantity` column name
- **Null Value Check**: Comprehensive validation for data completeness

### Business Intelligence Queries

1. **Daily Sales Analysis** - Retrieve all sales for specific dates (e.g., 2022-11-05)

2. **Category & Volume Analysis** - Filter high-volume clothing sales in November 2022

3. **Category Performance** - Total sales revenue by product category

4. **Customer Demographics** - Average age of customers by category (Beauty category focus)

5. **High-Value Transactions** - Identify transactions exceeding $1000

6. **Gender-Category Cross Analysis** - Transaction counts by gender and category

7. **Seasonal Performance** - Best performing months by year using window functions

8. **Top Customers** - Top 5 customers by total purchase value

9. **Category Reach** - Unique customer count per category

10. **Shift Analysis** - Sales distribution across time periods:
    - Morning: Before 12 PM
    - Afternoon: 12 PM - 5 PM  
    - Evening: After 5 PM

## Key Findings

### Sales Performance
- **Category Leaders**: Comprehensive breakdown of sales by product category
- **High-Value Customers**: Identified top 5 customers driving revenue
- **Peak Performance**: Best selling months identified using ranking functions

### Customer Insights
- **Demographic Patterns**: Beauty category customer age analysis
- **Gender Distribution**: Transaction patterns across categories by gender
- **Customer Reach**: Unique customer engagement per category

### Operational Insights
- **Time-based Patterns**: Sales distribution across morning, afternoon, and evening shifts
- **Volume Analysis**: High-quantity transactions in specific categories

## Database Setup

### Prerequisites
- MySQL or compatible SQL database
- Access to `retail_sales` database
- Appropriate read/write permissions for data cleaning operations

### Running the Analysis
1. **Connect to Database**:
   ```sql
   USE retail_sales;
   ```

2. **Execute Data Cleaning** (one-time setup):
   ```sql
   -- Fix column names and data types
   ALTER TABLE sales RENAME COLUMN Ã¯Â»Â¿transactions_id TO transaction_id;
   ALTER TABLE sales RENAME COLUMN quantiy TO quantity;
   ALTER TABLE sales MODIFY sale_date DATE;
   ```

3. **Run Analysis Queries**: Execute queries 1-10 in sequence for comprehensive analysis

## Technical Features
- **Window Functions**: Used RANK() for monthly performance analysis
- **Date Functions**: YEAR(), MONTH(), HOUR() for temporal analysis
- **Conditional Logic**: CASE statements for shift categorization
- **Aggregation**: GROUP BY operations for category and demographic analysis
- **Data Validation**: Comprehensive NULL checking across all columns

## Usage Instructions
1. Ensure the `retail_sales` database is accessible
2. Run the data cleaning section first (if not already executed)
3. Execute individual queries or run the complete script
4. Review results for business insights and decision-making

## Data Quality Notes
- All NULL value checks have been implemented
- Column naming inconsistencies have been resolved
- Date formatting has been standardized
- The dataset appears to be complete with no missing critical values

## Future Enhancements
- Add time-series forecasting queries
- Implement customer lifetime value calculations
- Create stored procedures for recurring analysis
- Add data visualization query exports
- Implement automated data quality monitoring
