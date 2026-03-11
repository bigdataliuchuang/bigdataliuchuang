# Case Map

这个文件用于索引当前案例，帮助读者快速判断先看什么、每个案例解决什么问题，以及适合什么难度阶段。

## 阅读建议

- 如果你刚接触 Flink SQL，先看 `00`、`02`、`03`
- 如果你在准备面试或做业务指标，优先看 `05`、`06`
- 如果你想理解更接近真实链路的流式处理，优先看 `07`

## 案例索引

| 文件 | 难度 | 标签 | 说明 |
| --- | --- | --- | --- |
| `00_prepare_tables.sql` | 入门 | base-tables, watermark, filesystem | 提供基础源表、维表和调试输出表 |
| `01_kafka_to_print.sql` | 入门 | kafka, source, debug | 验证 Kafka 到 Flink SQL 的最小消费链路 |
| `02_tumble_gmv.sql` | 入门 | tumble-window, gmv, metrics | 按分钟统计支付 GMV、订单数、支付用户数 |
| `03_user_uv.sql` | 入门 | uv, distinct, window | 统计分钟级订单 UV |
| `04_latest_order_per_user.sql` | 入门 | dedup, row-number, latest-record | 保留每个用户最新一笔订单 |
| `05_pay_conversion.sql` | 中级 | conversion, conditional-aggregation, metrics | 统计下单转支付转化率 |
| `06_city_gmv_topn.sql` | 中级 | dimension-join, topn, city-gmv | 关联维表并输出城市 GMV TopN |
| `07_order_payment_interval_join.sql` | 中级 | interval-join, payment-delay, dual-stream | 关联订单流和支付流，观察支付延迟 |

## 已有案例说明

### 00_prepare_tables.sql

- 目的：提供可复用的基础表定义
- 难度：入门
- 标签：`base-tables` `watermark` `filesystem`
- 重点：事件时间、水位线、文件源、调试输出

### 01_kafka_to_print.sql

- 目的：验证 Kafka 到 Flink SQL 的最小消费链路
- 难度：入门
- 标签：`kafka` `source` `debug`
- 重点：Kafka Source、消费组、最小调试链路

### 02_tumble_gmv.sql

- 目的：按分钟统计支付 GMV
- 难度：入门
- 标签：`tumble-window` `gmv` `metrics`
- 重点：窗口聚合、去除非支付事件、核心指标口径

### 03_user_uv.sql

- 目的：统计订单 UV
- 难度：入门
- 标签：`uv` `distinct` `window`
- 重点：窗口内去重、适合面试和业务看板场景

### 04_latest_order_per_user.sql

- 目的：保留每个用户最新一笔订单
- 难度：入门
- 标签：`dedup` `row-number` `latest-record`
- 重点：`ROW_NUMBER()`、去重、明细保留策略

### 05_pay_conversion.sql

- 目的：统计下单到支付的分钟级转化率
- 难度：中级
- 标签：`conversion` `conditional-aggregation` `metrics`
- 重点：条件聚合、指标口径、转化率计算

### 06_city_gmv_topn.sql

- 目的：输出每分钟城市 GMV TopN
- 难度：中级
- 标签：`dimension-join` `topn` `city-gmv`
- 重点：维表关联、窗口聚合、`ROW_NUMBER()` 排名

### 07_order_payment_interval_join.sql

- 目的：关联订单流和支付流，观察支付延迟
- 难度：中级
- 标签：`interval-join` `payment-delay` `dual-stream`
- 重点：双流 Join、事件时间、时间区间条件

## 下一批建议案例

- 会话窗口 Session Window
- TopN 热门商品
- 迟到数据处理
- 维表关联与实时画像标签
- CDC 入湖或入仓
