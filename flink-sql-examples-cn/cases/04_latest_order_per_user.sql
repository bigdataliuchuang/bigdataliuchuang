-- Scenario: Keep the latest order record for each user.
-- Input Tables: orders_file_src
-- Key Points: row_number, deduplication, latest record retention
-- Flink Version: 1.18.x

SELECT
  user_id,
  order_id,
  amount,
  event_type,
  DATE_FORMAT(rt, 'yyyy-MM-dd HH:mm:ss') AS event_time
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY rt DESC
    ) AS rn
  FROM orders_file_src
)
WHERE rn = 1;
