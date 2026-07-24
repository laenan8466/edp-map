# ===========================================
# GitHub Update Script
# ===========================================

# Immer im Ordner des Skripts arbeiten
Set-Location $PSScriptRoot

Write-Host ""
Write-Host "=== GitHub Synchronisierung ==="
Write-Host ""

# Auf main wechseln
git switch main
if ($LASTEXITCODE -ne 0) {
    Write-Host "Fehler beim Wechsel auf den Branch 'main'."
    Read-Host "Enter zum Beenden"
    exit 1
}

# Aktuellen Stand holen
git pull --rebase
if ($LASTEXITCODE -ne 0) {
    Write-Host "Fehler beim Abrufen der Änderungen."
    Read-Host "Enter zum Beenden"
    exit 1
}

# Alle Änderungen übernehmen
git add -A

# Prüfen ob sich etwas geändert hat
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "Keine Änderungen gefunden."
    Read-Host "Enter zum Beenden"
    exit 0
}

# Commit mit Zeitstempel
$CommitMessage = "Update $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

git commit -m "$CommitMessage"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Fehler beim Erstellen des Commits."
    Read-Host "Enter zum Beenden"
    exit 1
}

# Hochladen
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "Fehler beim Hochladen zu GitHub."
    Read-Host "Enter zum Beenden"
    exit 1
}

Write-Host ""
Write-Host "==========================================="
Write-Host "GitHub erfolgreich aktualisiert!"
Write-Host "Commit: $CommitMessage"
Write-Host "==========================================="
Write-Host ""