-- Daily Revenue & Paid Users Growth Analysis
-- Dataset: data-analytics-mate.user_acquisition.payments
-- Description: Calculates daily revenue and unique payers,
--              with absolute and percentage growth using window functions

WITH transactions_per_day AS (

  -- Step 1: Aggregate daily revenue and unique payers
  SELECT  
    DATE(transaction_datetime)        AS transaction_date,
    ROUND(SUM(sku_price_usd), 2)      AS day_revenue,
    COUNT(DISTINCT user_id)           AS unique_users_cnt
  FROM `data-analytics-mate.user_acquisition.payments`
  GROUP BY transaction_date

),

abs_growth AS (

  -- Step 2: Get previous day values using LAG window function
  SELECT
    transaction_date,
    day_revenue,
    LAG(day_revenue) OVER (ORDER BY transaction_date) AS abs_revenue_growth,
    unique_users_cnt,
    LAG(unique_users_cnt) OVER (ORDER BY transaction_date) AS abs_users_growth
  FROM transactions_per_day

)

-- Step 3: Calculate absolute and percentage growth
SELECT
  transaction_date,
  day_revenue,
  abs_revenue_growth,
  ROUND(((day_revenue - abs_revenue_growth) / abs_revenue_growth * 100), 2)     AS pct_revenue_growth,
  unique_users_cnt,
  abs_users_growth,
  ROUND(((unique_users_cnt - abs_users_growth) / abs_users_growth * 100), 2)    AS pct_users_growth
FROM abs_growth
