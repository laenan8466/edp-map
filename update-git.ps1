Set-Location $PSScriptRoot

git switch main
git pull --rebase
git add -A
git commit -m "Update $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git push origin main