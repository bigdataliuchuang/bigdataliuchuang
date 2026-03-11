# Repo Launch Guide

这个文档用于在你准备把 `flink-sql-examples-cn` 拆成独立仓库时，直接填写 GitHub 仓库信息和首发内容。

## 推荐仓库名

- `flink-sql-examples-cn`

## 推荐仓库描述

- `Chinese-first practical Flink SQL examples for streaming metrics, dedup, TopN, and interval join.`

## 推荐 Topics

- `flink`
- `flink-sql`
- `sql`
- `streaming`
- `big-data`
- `chinese`
- `kafka`
- `realtime`

## About 区域建议

- Website: 可以先留空，后续如果写文章合集或文档站再补
- Description: 使用上面的仓库描述
- Social preview: 使用 `assets/repo-cover.svg`

## 首次发布建议文案

### 中文短描述

`一个中文优先的 Flink SQL 实战案例库，聚焦窗口指标、去重、TopN、双流 Join 等高频业务场景。`

### 英文短描述

`A Chinese-first practical Flink SQL repository focused on business-oriented streaming scenarios instead of syntax-only snippets.`

## 首发时建议保留的文件

- `README.md`
- `LICENSE`
- `CHANGELOG.md`
- `Makefile`
- `.editorconfig`
- `.gitattributes`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `SECURITY.md`
- `SUPPORT.md`
- `.github/`
- `cases/`
- `data/`
- `docs/`
- `assets/`
- `docker-compose.yml`

## 首发建议动作

1. 上传 `assets/repo-cover.svg` 作为 social preview
2. 在 README 中保留前 3 个推荐案例，降低阅读压力
3. 首发后补 1 张运行截图，例如 Flink Web UI 或 SQL Client 输出
4. 配置 Topics，避免仓库只有 README 没有检索入口
5. 先按 [standalone-init.md](./standalone-init.md) 完成本地独立初始化
6. 发布后尽快写 1 篇文章，把外部流量导回仓库

## 首发时不建议做的事

- 不要一次性承诺太多路线图
- 不要先引入复杂 CI
- 不要把仓库做成大而全教程
- 不要提交 connector jar 或大样例数据
