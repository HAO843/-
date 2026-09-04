# Codex Team Sync

This repo is meant to be shared by three computers.

## One-time setup

1. Create a GitHub repository.
2. Copy the repo URL.
3. Run the bootstrap script on each computer:

```powershell
.\scripts\bootstrap.ps1 -RepoUrl "https://github.com/HAO843/-.git"
```

## Daily workflow

```powershell
git checkout main
git pull --rebase origin main
git checkout -b work/<task-name>
```

After changes:

```powershell
git add .
git commit -m "describe work"
git push -u origin HEAD
```

## When someone else finished first

```powershell
git checkout main
git pull --rebase origin main
```
