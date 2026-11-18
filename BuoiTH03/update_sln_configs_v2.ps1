$slnPath = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03\BTH03.sln"
$lines = @(Get-Content -Path $slnPath)

# Find the line with "EndGlobalSection" (first one after configurations)
$endGlobalIndex = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "EndGlobalSection" -and $i -gt 100) {  # Skip early ones
        $endGlobalIndex = $i
        break
    }
}

if ($endGlobalIndex -lt 0) {
    Write-Host "Could not find EndGlobalSection"
    exit
}

Write-Host "Found EndGlobalSection at line $($endGlobalIndex + 1)"

# Configuration entries for 4 new projects
$newConfigs = @(
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|Any CPU.Build.0 = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x64.ActiveCfg = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x64.Build.0 = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x86.ActiveCfg = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x86.Build.0 = Debug|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|Any CPU.ActiveCfg = Release|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|Any CPU.Build.0 = Release|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x64.ActiveCfg = Release|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x64.Build.0 = Release|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x86.ActiveCfg = Release|Any CPU",
    "`t`t{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x86.Build.0 = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|Any CPU.ActiveCfg = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|Any CPU.Build.0 = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x64.ActiveCfg = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x64.Build.0 = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x86.ActiveCfg = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x86.Build.0 = Debug|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|Any CPU.ActiveCfg = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|Any CPU.Build.0 = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x64.ActiveCfg = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x64.Build.0 = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x86.ActiveCfg = Release|Any CPU",
    "`t`t{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x86.Build.0 = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|Any CPU.ActiveCfg = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|Any CPU.Build.0 = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x64.ActiveCfg = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x64.Build.0 = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x86.ActiveCfg = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x86.Build.0 = Debug|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|Any CPU.ActiveCfg = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|Any CPU.Build.0 = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x64.ActiveCfg = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x64.Build.0 = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x86.ActiveCfg = Release|Any CPU",
    "`t`t{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x86.Build.0 = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|Any CPU.ActiveCfg = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|Any CPU.Build.0 = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x64.ActiveCfg = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x64.Build.0 = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x86.ActiveCfg = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x86.Build.0 = Debug|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|Any CPU.ActiveCfg = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|Any CPU.Build.0 = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x64.ActiveCfg = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x64.Build.0 = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x86.ActiveCfg = Release|Any CPU",
    "`t`t{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x86.Build.0 = Release|Any CPU"
)

# Insert new configs before EndGlobalSection
$lines = $lines[0..($endGlobalIndex-1)] + $newConfigs + $lines[$endGlobalIndex..($lines.Count-1)]

# Write back to file
Set-Content -Path $slnPath -Value $lines -Encoding UTF8

Write-Host "Configuration entries added successfully"
