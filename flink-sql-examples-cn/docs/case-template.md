# Case Template

新增案例时，尽量按下面格式组织，避免仓库后续风格失控。

## 文件命名

- 使用 `NN_topic_name.sql`
- `NN` 使用两位数字，按案例顺序递增
- 名称尽量表达业务意图，而不是只写语法名

示例：

- `08_lookup_join_user_level.sql`
- `09_topn_hot_products.sql`

## 文件头注释模板

```sql
-- Scenario: 用一句话说明业务场景
-- Input Tables: table_a, table_b
-- Key Points: window aggregation, dedup, join
-- Flink Version: 1.18.x
```

## 案例内容建议

一个案例应尽量能让读者快速回答这些问题：

1. 这个 SQL 在解决什么业务问题
2. 依赖哪些输入表
3. 核心 SQL 长什么样
4. 结果字段代表什么
5. 常见坑点在哪里

## 样例数据约束

- 保持文本格式，可读、可 diff
- 尽量小，能说明问题即可
- 不要提交大文件、压缩包、二进制内容
- 不要提交 connector jar

## 文档策略

- 默认不为每个案例单独写长篇文档
- 统一通过 [case-map.md](./case-map.md) 做索引和简要说明
- 只有当案例本身明显复杂时，再考虑单独补说明文档
