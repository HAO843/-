param(
    [Parameter(Mandatory = $true)]
    [string]$RepoUrl,
    [string]$TargetPath = (Get-Location).Path
)

$git = (Get-Command git).Source

if (Test-Path (Join-Path $TargetPath ".git")) {
    & $git -C $TargetPath remote set-url origin $RepoUrl
    & $git -C $TargetPath fetch origin
    & $git -C $TargetPath checkout main
    & $git -C $TargetPath pull --rebase origin main
    exit $LASTEXITCODE
}

if (-not (Test-Path $TargetPath)) {
    New-Item -ItemType Directory -Path $TargetPath | Out-Null
}

& $git clone $RepoUrl $TargetPath
