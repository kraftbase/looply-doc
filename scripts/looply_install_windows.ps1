# Python Environment and s3-extend Installation Script for Windows

# Step 1: Verify Python installation
try {
    $pythonVersion = python --version
    Write-Host "Python is installed: $pythonVersion"
}
catch {
    Write-Host "Python is not installed or not in PATH."
    exit 1
}

# Step 2: Create virtual environment if it doesn't exist
$envPath = "$HOME\.looply\env"
if (-Not (Test-Path $envPath)) {
    Write-Host "Creating virtual environment..."
    try {
        python -m venv $envPath
        if (Test-Path $envPath) {
            Write-Host "Virtual environment created successfully."
        }
    }
    catch {
        Write-Host "Failed to create virtual environment."
        exit 1
    }
}
else {
    Write-Host "Virtual environment already exists."
}

# Step 3: Activate virtual environment
$activationScript = "$envPath\Scripts\Activate.ps1"
if (Test-Path $activationScript) {
    Write-Host "Activating virtual environment..."
    & $activationScript
}
else {
    Write-Host "Activation script not found."
    exit 1
}

# Step 4: Upgrade pip
try {
    python -m pip install --upgrade pip
    Write-Host "Pip upgraded successfully."
}
catch {
    Write-Host "Failed to upgrade pip."
    exit 1
}

# Step 5: Install s3-extend if not installed
try {
    $installedPackages = pip list
    if ($installedPackages -notmatch "s3-extend") {
        Write-Host "Installing s3-extend..."
        pip install s3-extend
    }
    else {
        Write-Host "s3-extend is already installed."
    }
}
catch {
    Write-Host "Failed to install s3-extend."
    exit 1
}

# Step 6: Run s3a add
try {
    Write-Host "Running s3a add..."
    s3a
}
catch {
    Write-Host "Failed to run s3a command."
    exit 1
}