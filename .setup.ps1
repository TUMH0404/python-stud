$ErrorActionPreference = "Stop"

# =========================
# Settings
# =========================
$RepoUrl    = "https://github.com/TUMH0404/python-stud.git"
$TargetRoot = Join-Path $env:USERPROFILE "Documents"
$TargetDir  = Join-Path $TargetRoot "python-stud"
$GitRoot    = Join-Path $env:LOCALAPPDATA "PortableGit"
$TempDir    = Join-Path $env:TEMP "portablegit_setup"
$ApiUrl     = "https://api.github.com/repos/git-for-windows/git/releases/latest"

function Write-Step($msg) {
    Write-Host ""
    Write-Host $msg -ForegroundColor Cyan
}

function Add-UserPathIfMissing($pathToAdd) {
    $currentUserPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ([string]::IsNullOrWhiteSpace($currentUserPath)) {
        $newPath = $pathToAdd
    }
    elseif ($currentUserPath.Split(";") -contains $pathToAdd) {
        $newPath = $currentUserPath
    }
    else {
        $newPath = $currentUserPath.TrimEnd(";") + ";" + $pathToAdd
    }

    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")

    if (-not (($env:Path -split ";") -contains $pathToAdd)) {
        $env:Path += ";$pathToAdd"
    }
}

function Get-GitExe {
    $cmd = Get-Command git -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }

    $candidates = @(
        (Join-Path $GitRoot "cmd\git.exe"),
        (Join-Path $GitRoot "bin\git.exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\Git\cmd\git.exe"),
        (Join-Path $env:ProgramFiles "Git\cmd\git.exe")
    )

    foreach ($c in $candidates) {
        if (Test-Path $c) { return $c }
    }

    return $null
}

try {
    Write-Host "=====================================" -ForegroundColor Yellow
    Write-Host " PortableGit + Clone Setup (Windows) " -ForegroundColor Yellow
    Write-Host "=====================================" -ForegroundColor Yellow

    # -------------------------
    # 1. Prepare folders
    # -------------------------
    Write-Step "1. Preparing folders..."

    if (-not (Test-Path $TargetRoot)) {
        New-Item -ItemType Directory -Path $TargetRoot | Out-Null
    }

    if (-not (Test-Path $TempDir)) {
        New-Item -ItemType Directory -Path $TempDir | Out-Null
    }

    # -------------------------
    # 2. Find or install Git
    # -------------------------
    Write-Step "2. Checking Git..."

    $gitExe = Get-GitExe

    if (-not $gitExe) {
        Write-Host "Git not found. Downloading PortableGit..." -ForegroundColor Yellow

        $release = Invoke-RestMethod -Uri $ApiUrl -Headers @{ "User-Agent" = "PowerShell" }

        $asset = $release.assets | Where-Object {
            $_.name -match '^PortableGit-.*-64-bit\.7z\.exe$'
        } | Select-Object -First 1

        if (-not $asset) {
            throw "PortableGit x64 asset was not found in the latest Git for Windows release."
        }

        $portableExe = Join-Path $TempDir $asset.name

        Write-Host "Downloading: $($asset.name)"
        Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $portableExe

        if (Test-Path $GitRoot) {
            Remove-Item -Recurse -Force $GitRoot
        }
        New-Item -ItemType Directory -Path $GitRoot | Out-Null

        Write-Host "Extracting PortableGit..."
        $extractArgs = @(
            "-y"
            "-o$GitRoot"
        )

        $proc = Start-Process -FilePath $portableExe -ArgumentList $extractArgs -Wait -PassThru -NoNewWindow
        if ($proc.ExitCode -ne 0) {
            throw "PortableGit extraction failed. Exit code: $($proc.ExitCode)"
        }

        $gitCmdPath = Join-Path $GitRoot "cmd"
        if (-not (Test-Path (Join-Path $gitCmdPath "git.exe"))) {
            throw "git.exe was not found after extraction."
        }

        Add-UserPathIfMissing $gitCmdPath
        $gitExe = Join-Path $gitCmdPath "git.exe"

        Write-Host "PortableGit installed at: $GitRoot" -ForegroundColor Green
    }
    else {
        Write-Host "Git found: $gitExe" -ForegroundColor Green
    }

    # -------------------------
    # 3. Show version
    # -------------------------
    Write-Step "3. Git version..."
    & $gitExe --version

    # -------------------------
    # 4. Remove old repo if exists
    # -------------------------
    Write-Step "4. Removing old repository if it exists..."

    if (Test-Path $TargetDir) {
        Remove-Item -Recurse -Force $TargetDir
        Write-Host "Old folder deleted: $TargetDir"
    }
    else {
        Write-Host "No existing folder found."
    }

    # -------------------------
    # 5. Clone repository
    # -------------------------
    Write-Step "5. Cloning repository..."

    Set-Location $TargetRoot
    & $gitExe clone $RepoUrl

    if (-not (Test-Path $TargetDir)) {
        throw "Clone seems to have completed, but the target folder was not found."
    }

    # -------------------------
    # 6. Move into repo
    # -------------------------
    Write-Step "6. Entering repository..."
    Set-Location $TargetDir

    Write-Host ""
    Write-Host "Setup completed successfully." -ForegroundColor Green
    Write-Host "Repository: $TargetDir" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    Write-Host ""
    Write-Host "Press Enter to close..."
    Read-Host | Out-Null
}
