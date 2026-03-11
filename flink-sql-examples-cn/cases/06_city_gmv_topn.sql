-- Scenario: Rank top cities by minute-level GMV after joining user dimensions.
-- Input Tables: orders_file_src, user_profiles
-- Key Points: dimension join, topn, row_number, window aggregation
-- Flink Version: 1.18.x

WITH enriched_orders AS (
  SELECT
    o.user_id,
    o.amount,
    o.rt,
    COALESCE(u.city, 'UNKNOWN') AS city
  FROM orders_file_src AS o
  LEFT JOIN user_profiles AS u
  ON o.user_id = u.user_id
  WHERE o.event_type = 'pay'
),
city_gmv AS (
  SELECT
    window_start,
    window_end,
    city,
    SUM(amount) AS gmv
  FROM TABLE(
    TUMBLE(
      TABLE enriched_orders,
      DESCRIPTOR(rt),
      INTERVAL '1' MINUTE
    )
  )
  GROUP BY window_start, window_end, city
)
SELECT
  window_start,
  window_end,
  city,
  gmv,
  rn
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY window_start, window_end
      ORDER BY gmv DESC
    ) AS rn
  FROM city_gmv
)
WHERE rn <= 2;
