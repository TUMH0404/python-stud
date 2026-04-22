$TARGET = "$env:USERPROFILE\Documents\python-stud"

Write-Host "====================================="
Write-Host "  Git + Clone Setup (Windows)"
Write-Host "====================================="

Write-Host ""
Write-Host "1. Checking existing folder..."

if (Test-Path $TARGET) {
    Remove-Item -Recurse -Force $TARGET
    Write-Host "Folder deleted."
} else {
    Write-Host "Folder does not exist."
}

Write-Host ""
Write-Host "2. Moving to Documents..."
Set-Location "$env:USERPROFILE\Documents"

Write-Host ""
Write-Host "3. Checking Git..."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed."
    Write-Host "Please install Git first."
    exit 1
}

Write-Host ""
Write-Host "4. Cloning repository..."

try {
    git clone https://github.com/TUMH0404/python-stud.git
    Write-Host "Clone successful."
} catch {
    Write-Host "Clone failed."
    exit 1
}

Write-Host ""
Write-Host "5. Moving into project folder..."
Set-Location $TARGET

Write-Host ""
Write-Host "All done."
