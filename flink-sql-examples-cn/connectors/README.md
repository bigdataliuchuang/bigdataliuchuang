# Connectors

这个目录用于放 Flink SQL 运行需要的外部 connector jar。

## Kafka Connector

如需运行 `cases/01_kafka_to_print.sql`，请下载与你的 Flink 版本匹配的 Kafka connector，并放到当前目录。

建议目录结构：

```text
connectors/
└── flink-sql-connector-kafka-<version>.jar
```

放置完成后，重新执行：

```bash
docker compose up -d
```

或重启相关容器以加载新的 jar。
