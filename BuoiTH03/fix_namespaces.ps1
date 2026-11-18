# Fix all namespace declarations to remove spaces
$solutionDir = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03"

# Get all project directories
$projectDirs = Get-ChildItem -Path $solutionDir -Directory | Where-Object { $_.Name -like "*_*" }

foreach ($projectDir in $projectDirs) {
    $projectName = $projectDir.Name
    $validNamespace = $projectName -replace ' ', ''

    # Find all .cs files in this project
    $csFiles = Get-ChildItem -Path $projectDir.FullName -Filter "*.cs" -File

    foreach ($file in $csFiles) {
        $content = Get-Content -Path $file.FullName -Raw

        # Replace namespace declarations
        $content = $content -replace "namespace $projectName", "namespace $validNamespace"

        # Also replace the old project name with valid name in namespace references
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Fixed namespace in: $($file.Name) (Project: $projectName)"
    }
}

Write-Host "All namespaces fixed!" -ForegroundColor Green
