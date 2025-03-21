Write-Host @"
HexHSL
A cross-platform hex to HSL color converter
By Pearled (https://github.com/PearledDev/hexhsl)
"@
Write-Host "Starting installation..." -ForegroundColor Cyan
Write-Host ""

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator!"
    break
}

$defaultDir = "C:\Program Files\Pearled\ostools"
$installDir = Read-Host -Prompt "Enter installation directory [$defaultDir]"
if ([string]::IsNullOrWhiteSpace($installDir)) {
    $installDir = $defaultDir
}
$exePath = Join-Path $installDir "hexhsl.exe"

if (-not (Test-Path $installDir)) {
    try {
        New-Item -ItemType Directory -Path $installDir -Force | Out-Null
        Write-Host "Created installation directory: $installDir"
    }
    catch {
        Write-Error "Failed to create installation directory: $_"
        exit 1
    }
}

try {
    Write-Host "Downloading hexhsl..."
    $url = "https://github.com/PearledDev/hexhsl/releases/latest/download/hexhsl.exe"
    Invoke-WebRequest -Uri $url -OutFile $exePath
    Write-Host "Successfully downloaded hexhsl!"
}
catch {
    Write-Error "Failed to download hexhsl: $_"
    exit 1
}

$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if ($currentPath -notlike "*$installDir*") {
    try {
        [Environment]::SetEnvironmentVariable("Path", "$currentPath;$installDir", "Machine")
        Write-Host "Added hexhsl to PATH"
    }
    catch {
        Write-Error "Failed to add to PATH: $_"
        exit 1
    }
}

Write-Host "`nhexhsl has been successfully installed!"
Write-Host "You may need to restart your terminal for the PATH changes to take effect."
Write-Host "Try running 'hexhsl' in a new terminal window." 