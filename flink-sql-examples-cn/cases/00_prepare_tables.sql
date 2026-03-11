-- Scenario: Define reusable base tables for local file-based demos and debugging.
-- Input Tables: orders.jsonl, user_profiles.csv, order_created.jsonl, payments.jsonl
-- Key Points: filesystem source, watermark, event time, debug sink
-- Flink Version: 1.18.x

-- Base source table backed by a local JSON Lines file.
CREATE TEMPORARY TABLE orders_file_src (
  order_id STRING,
  user_id STRING,
  amount DECIMAL(10, 2),
  event_type STRING,
  ts BIGINT,
  rt AS TO_TIMESTAMP_LTZ(ts, 3),
  WATERMARK FOR rt AS rt - INTERVAL '5' SECOND
) WITH (
  'connector' = 'filesystem',
  'path' = 'file:///workspace/data/orders.jsonl',
  'format' = 'json'
);

-- Dimension table example using a local CSV file.
CREATE TEMPORARY TABLE user_profiles (
  user_id STRING,
  city STRING,
  user_level STRING
) WITH (
  'connector' = 'filesystem',
  'path' = 'file:///workspace/data/user_profiles.csv',
  'format' = 'csv'
);

-- Order create stream used for interval join demos.
CREATE TEMPORARY TABLE order_created_src (
  order_id STRING,
  user_id STRING,
  amount DECIMAL(10, 2),
  ts BIGINT,
  create_rt AS TO_TIMESTAMP_LTZ(ts, 3),
  WATERMARK FOR create_rt AS create_rt - INTERVAL '5' SECOND
) WITH (
  'connector' = 'filesystem',
  'path' = 'file:///workspace/data/order_created.jsonl',
  'format' = 'json'
);

-- Payment stream used for interval join demos.
CREATE TEMPORARY TABLE payments_file_src (
  pay_id STRING,
  order_id STRING,
  pay_amount DECIMAL(10, 2),
  pay_channel STRING,
  ts BIGINT,
  pay_rt AS TO_TIMESTAMP_LTZ(ts, 3),
  WATERMARK FOR pay_rt AS pay_rt - INTERVAL '5' SECOND
) WITH (
  'connector' = 'filesystem',
  'path' = 'file:///workspace/data/payments.jsonl',
  'format' = 'json'
);

-- Debug sink for quick verification in SQL Client logs.
CREATE TEMPORARY TABLE print_sink (
  order_id STRING,
  user_id STRING,
  amount DECIMAL(10, 2),
  event_type STRING,
  rt TIMESTAMP_LTZ(3)
) WITH (
  'connector' = 'print'
);
