# Standalone Init

这个文档用于把当前子目录独立初始化成一个新仓库。

## 目标

把 `flink-sql-examples-cn/` 从当前大仓库中拷出去，变成一个可单独提交、单独发布的 Git 仓库。

## 建议步骤

在当前工作区外选择一个新的目录，然后执行：

```bash
cp -R flink-sql-examples-cn /path/to/new-workspace/flink-sql-examples-cn
cd /path/to/new-workspace/flink-sql-examples-cn
git init
git add .
git commit -m "chore: initialize standalone repository"
```

如果你已经提前在 GitHub 创建了空仓库，再执行：

```bash
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

## 初始化后建议检查

- `README.md` 首页是否正常显示封面图和内部链接
- `.github/` 模板是否已一并带出
- `assets/repo-cover.svg` 是否可作为 social preview 上传
- `Makefile` 命令是否可用
- `docker-compose.yml` 能否在目标环境拉起

## 建议首个本地验证命令

```bash
make up
make ps
make sql-client
```

## 不建议在初始化时做的事

- 不要一开始就加复杂 CI
- 不要先提交 connector jar
- 不要把无关目录一起拷进新仓库
