# Step 1: Verify Python installation
$pythonVersion = python --version
if ($pythonVersion) {
    Write-Host "Python is installed: $pythonVersion"
} else {
    Write-Host "Python is not installed."
    exit
}

# Step 2: Create virtual environment if it doesn't exist
$envPath = "..\myenv"
if (Test-Path $envPath) {
    Write-Host "Virtual environment already exists."
} else {
    Write-Host "Creating virtual environment..."
    python -m venv $envPath
    if (Test-Path $envPath) {
        Write-Host "Virtual environment created successfully."
    } else {
        Write-Host "Failed to create virtual environment."
        exit
    }
}

# Step 3: Activate virtual environment
Write-Host "Activating virtual environment..."
& "$envPath\Scripts\Activate"

# Step 4: Upgrade pip
Write-Host "Upgrading pip..."
python -m pip install --upgrade pip

# Step 6: Check if s3-extend is installed
$installedPackages = pip list
if ($installedPackages -match "s3-extend") {
    Write-Host "s3-extend is installed."
} else {
    Write-Host "s3-extend is not installed."
    Write-Host "Installing s3-extend..."
    pip install s3-extend
}
# Step 5: Install s3-extend if not installed

# Step 7: Run s3a add
Write-Host "Running s32 add..."
s32
