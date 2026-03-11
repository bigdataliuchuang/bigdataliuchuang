-- Scenario: Count minute-level unique ordering users.
-- Input Tables: orders_file_src
-- Key Points: distinct count, tumble window, uv metric
-- Flink Version: 1.18.x

SELECT
  DATE_FORMAT(window_start, 'yyyy-MM-dd HH:mm:ss') AS win_start,
  DATE_FORMAT(window_end, 'yyyy-MM-dd HH:mm:ss') AS win_end,
  COUNT(DISTINCT user_id) AS order_uv
FROM TABLE(
  TUMBLE(
    TABLE orders_file_src,
    DESCRIPTOR(rt),
    INTERVAL '1' MINUTE
  )
)
GROUP BY window_start, window_end;
