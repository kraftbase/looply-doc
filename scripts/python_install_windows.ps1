# PowerShell Script for Python 3.12.1 Installation on Windows

# Function to check Python version
function Test-PythonVersion {
    try {
        $version = python --version
        if ($version -match "Python 3\.12\.1") {
            Write-Host "Python 3.12.1 is already installed: $version"
            return $true
        }
        return $false
    }
    catch {
        return $false
    }
}

# Check if Python 3.12.1 is already installed
if (Test-PythonVersion) {
    exit 0
}

# Python download URL
$pythonUrl = "https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe"
$installerPath = "$env:TEMP\python_installer.exe"

try {
    # Download Python installer
    Write-Host "Downloading Python 3.12.1 installer..."
    Invoke-WebRequest -Uri $pythonUrl -OutFile $installerPath

    # Silent install with PATH option
    Write-Host "Installing Python 3.12.1..."
    Start-Process -FilePath $installerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

    # Verify installation
    Write-Host "Verifying Python installation..."
    python --version

    # Clean up installer
    Remove-Item $installerPath -Force

    Write-Host "Python 3.12.1 installed successfully!"
}
catch {
    Write-Host "An error occurred during Python installation: $_"
    exit 1
}