# Contributing

感谢你愿意改进 `flink-sql-examples-cn`。

这个仓库采用轻维护策略，优先接收以下贡献：

- 高频业务场景案例
- 文档修正
- 运行步骤修正
- 兼容性说明补充

## 提问前自查

如果你准备提 Issue，请先确认：

- 已说明 Flink 版本
- 已说明运行方式，例如 `docker compose` 或本地 SQL Client
- 已提供相关 SQL 文件或最小复现 SQL
- 已贴出完整报错，而不是只描述“跑不起来”
- 已阅读 [README.md](./README.md) 和 [SUPPORT.md](./SUPPORT.md)

## 贡献案例格式

新增案例请尽量保持统一：

1. 文件命名使用 `NN_topic_name.sql`
2. 文件头部使用统一注释，包含：
   - 场景
   - 输入表
   - 核心知识点
   - 适用版本
3. 样例尽量小而可读，方便快速理解和复制
4. 如果依赖样例数据，请放在 `data/` 下，并保持文本格式

参考模板见 [docs/case-template.md](./docs/case-template.md)。

## PR 建议

- PR 标题尽量直接，例如：
  - `docs: fix quick start typo`
  - `cases: add lookup join example`
  - `docs: improve issue guidance`
- PR 描述请至少说明：
  - 改了什么
  - 为什么改
  - 如何验证

## 不要提交的内容

- Connector jar
- 大型数据文件
- 二进制附件
- 与仓库主题无关的泛化学习资料

如果你想补充非常大的内容，建议先提 Feature Request 说明价值，再决定是否适合放进仓库。
