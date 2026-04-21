$URL  = "https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/Git-2.54.0-64-bit.exe"
$FILE = "$env:TEMP\Git-2.54.0-64-bit.exe"
$GIT  = "${env:ProgramFiles}\Git\bin\git.exe"

Write-Host "====================================="
Write-Host "  Git for Windows Auto Install"
Write-Host "====================================="
Write-Host ""

Write-Host "1. Downloading installer..."
Invoke-WebRequest -Uri $URL -OutFile $FILE

if (-not (Test-Path $FILE)) {
    Write-Host ""
    Write-Host "[Error] Download failed."
    exit 1
}

Write-Host ""
Write-Host "2. Installing Git..."
Start-Process -FilePath $FILE -ArgumentList "/VERYSILENT /NORESTART" -Wait

if (-not (Test-Path $GIT)) {
    Write-Host ""
    Write-Host "[Error] Git installation could not be confirmed."
    exit 1
}

Write-Host ""
Write-Host "3. Installation complete. Checking Git version..."
& $GIT --version

Write-Host ""
Write-Host "4. Cloning sample repository..."
Set-Location "$env:USERPROFILE\Desktop"
& $GIT clone https://github.com/TUMH0404/python-stud.git

Write-Host ""
Write-Host "All done."
