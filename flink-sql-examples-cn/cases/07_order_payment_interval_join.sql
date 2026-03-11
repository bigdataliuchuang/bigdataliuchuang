-- Scenario: Join order creation and payment streams to inspect payment delay.
-- Input Tables: order_created_src, payments_file_src
-- Key Points: interval join, event time, payment latency
-- Flink Version: 1.18.x

SELECT
  o.order_id,
  o.user_id,
  o.amount AS order_amount,
  p.pay_amount,
  p.pay_channel,
  DATE_FORMAT(o.create_rt, 'yyyy-MM-dd HH:mm:ss') AS create_time,
  DATE_FORMAT(p.pay_rt, 'yyyy-MM-dd HH:mm:ss') AS pay_time,
  TIMESTAMPDIFF(SECOND, o.create_rt, p.pay_rt) AS pay_delay_seconds
FROM order_created_src AS o
JOIN payments_file_src AS p
ON o.order_id = p.order_id
AND p.pay_rt BETWEEN o.create_rt AND o.create_rt + INTERVAL '15' MINUTE;
