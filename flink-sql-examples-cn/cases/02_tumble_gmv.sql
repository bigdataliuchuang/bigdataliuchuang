-- Scenario: Calculate minute-level GMV and payment metrics from order events.
-- Input Tables: orders_file_src
-- Key Points: tumble window, payment filtering, business metrics
-- Flink Version: 1.18.x

SELECT
  window_start,
  window_end,
  COUNT(*) AS order_cnt,
  COUNT(DISTINCT user_id) AS pay_user_cnt,
  SUM(amount) AS gmv
FROM TABLE(
  TUMBLE(
    TABLE orders_file_src,
    DESCRIPTOR(rt),
    INTERVAL '1' MINUTE
  )
)
WHERE event_type = 'pay'
GROUP BY window_start, window_end;
