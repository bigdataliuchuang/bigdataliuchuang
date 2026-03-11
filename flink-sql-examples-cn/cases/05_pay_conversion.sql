-- Scenario: Calculate minute-level order-to-payment conversion rate.
-- Input Tables: orders_file_src
-- Key Points: conditional aggregation, conversion metric, tumble window
-- Flink Version: 1.18.x

WITH minute_metrics AS (
  SELECT
    window_start,
    window_end,
    COUNT(DISTINCT CASE WHEN event_type = 'create' THEN order_id END) AS create_order_cnt,
    COUNT(DISTINCT CASE WHEN event_type = 'pay' THEN order_id END) AS pay_order_cnt
  FROM TABLE(
    TUMBLE(
      TABLE orders_file_src,
      DESCRIPTOR(rt),
      INTERVAL '1' MINUTE
    )
  )
  GROUP BY window_start, window_end
)
SELECT
  window_start,
  window_end,
  create_order_cnt,
  pay_order_cnt,
  CASE
    WHEN create_order_cnt = 0 THEN CAST(NULL AS DECIMAL(10, 4))
    ELSE CAST(pay_order_cnt AS DECIMAL(10, 4)) / CAST(create_order_cnt AS DECIMAL(10, 4))
  END AS pay_conversion_rate
FROM minute_metrics;
