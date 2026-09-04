param(
    [string]$Version = "2.100.0"
)

$base = Join-Path $env:TEMP "gh-cli"
$zip = Join-Path $env:TEMP ("gh_{0}_windows_amd64.zip" -f $Version)
$url = "https://github.com/cli/cli/releases/download/v$Version/gh_{0}_windows_amd64.zip" -f $Version

Remove-Item $base -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $base | Out-Null
Invoke-WebRequest -UseBasicParsing $url -OutFile $zip
Expand-Archive -Path $zip -DestinationPath $base -Force
Get-ChildItem $base -Recurse -Filter gh.exe | Select-Object -First 1 -ExpandProperty FullName
