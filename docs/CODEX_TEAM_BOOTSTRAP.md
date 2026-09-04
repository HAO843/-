# 给另外两台电脑上的 Codex

把下面这段直接发给每台电脑上的 Codex：

```text
请把这台电脑接入 GitHub 仓库 https://github.com/HAO843/-.git。
优先使用本机仓库目录 C:\Users\27347\Documents\ChatGPT\人工智能应用竞赛。
如果目录里已有 git 仓库，就把 origin 指向这个地址并拉取 main。
如果没有仓库，就先 clone 这个地址到该目录。
完成后，创建或更新 `work/<task-name>` 分支，提交改动并推送。
不要删除现有文件，不要重置历史，不要改动 GitHub 仓库名。
```

在每台电脑上执行：

```powershell
cd C:\Users\27347\Documents\ChatGPT\人工智能应用竞赛
.\scripts\bootstrap.ps1 -RepoUrl "https://github.com/HAO843/-.git" -TargetPath "C:\Users\27347\Documents\ChatGPT\人工智能竞赛"
git checkout main
git pull --rebase origin main
```

日常同步：

```powershell
git checkout main
git pull --rebase origin main
git checkout -b work/<task-name>
```

交付前：

```powershell
git add .
git commit -m "describe work"
git push -u origin HEAD
```

