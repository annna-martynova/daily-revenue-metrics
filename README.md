# Daily Revenue Metrics

## About
SQL analysis built for a marketing team to track day-over-day revenue 
and paid users dynamics. Calculates daily totals and growth rates 
using window functions in BigQuery.

## Tools
SQL, Google BigQuery, Window Functions (LAG)

## Dataset
`data-analytics-mate.user_acquisition.payments`

## Metrics Calculated
- Daily revenue
- Absolute and percentage revenue growth vs. previous day
- Daily unique payers count
- Absolute and percentage payers growth vs. previous day

## Query
[daily_revenue.sql](queries/daily_revenue.sql)
