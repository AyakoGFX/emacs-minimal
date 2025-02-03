# Get the current directory
$CurrentFolder = Get-Location

# Get the existing user PATH variable
$CurrentPath = [System.Environment]::GetEnvironmentVariable("Path", "User")

# Check if the folder is already in PATH
if ($CurrentPath -split ";" -contains $CurrentFolder) {
    Write-Host "The folder is already in PATH: $CurrentFolder" -ForegroundColor Yellow
} else {
    # Append the current folder to the PATH
    $NewPath = $CurrentPath + ";" + $CurrentFolder

    # Update the user PATH variable
    [System.Environment]::SetEnvironmentVariable("Path", $NewPath, "User")

    Write-Host "Successfully added to PATH: $CurrentFolder" -ForegroundColor Green
}
