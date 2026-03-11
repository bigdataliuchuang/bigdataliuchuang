-- Scenario: Consume order events from Kafka and print them for quick pipeline validation.
-- Input Tables: orders_kafka_src
-- Key Points: kafka source, group id, debug sink
-- Flink Version: 1.18.x

-- Before running this file:
-- 1. Put the Kafka connector jar into ./connectors
-- 2. Create a topic named orders_json and write the sample data into it

CREATE TEMPORARY TABLE orders_kafka_src (
  order_id STRING,
  user_id STRING,
  amount DECIMAL(10, 2),
  event_type STRING,
  ts BIGINT,
  rt AS TO_TIMESTAMP_LTZ(ts, 3),
  WATERMARK FOR rt AS rt - INTERVAL '5' SECOND
) WITH (
  'connector' = 'kafka',
  'topic' = 'orders_json',
  'properties.bootstrap.servers' = 'kafka:29092',
  'properties.group.id' = 'flink-sql-examples',
  'scan.startup.mode' = 'earliest-offset',
  'format' = 'json'
);

INSERT INTO print_sink
SELECT
  order_id,
  user_id,
  amount,
  event_type,
  rt
FROM orders_kafka_src;
