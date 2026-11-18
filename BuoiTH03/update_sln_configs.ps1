$slnPath = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03\BTH03.sln"
$content = Get-Content -Path $slnPath -Raw

# New configuration entries for the 4 new projects
# GUIDs match what we added above
$guids = @(
    "{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}",
    "{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}",
    "{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}",
    "{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}"
)

$newConfigs = @"
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|Any CPU.Build.0 = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x64.ActiveCfg = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x64.Build.0 = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x86.ActiveCfg = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Debug|x86.Build.0 = Debug|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|Any CPU.ActiveCfg = Release|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|Any CPU.Build.0 = Release|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x64.ActiveCfg = Release|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x64.Build.0 = Release|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x86.ActiveCfg = Release|Any CPU
        {K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}.Release|x86.Build.0 = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|Any CPU.Build.0 = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x64.ActiveCfg = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x64.Build.0 = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x86.ActiveCfg = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Debug|x86.Build.0 = Debug|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|Any CPU.ActiveCfg = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|Any CPU.Build.0 = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x64.ActiveCfg = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x64.Build.0 = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x86.ActiveCfg = Release|Any CPU
        {L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}.Release|x86.Build.0 = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|Any CPU.Build.0 = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x64.ActiveCfg = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x64.Build.0 = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x86.ActiveCfg = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Debug|x86.Build.0 = Debug|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|Any CPU.ActiveCfg = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|Any CPU.Build.0 = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x64.ActiveCfg = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x64.Build.0 = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x86.ActiveCfg = Release|Any CPU
        {M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}.Release|x86.Build.0 = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|Any CPU.Build.0 = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x64.ActiveCfg = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x64.Build.0 = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x86.ActiveCfg = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Debug|x86.Build.0 = Debug|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|Any CPU.ActiveCfg = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|Any CPU.Build.0 = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x64.ActiveCfg = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x64.Build.0 = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x86.ActiveCfg = Release|Any CPU
        {N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}.Release|x86.Build.0 = Release|Any CPU
"@

# Find position to insert configuration entries (before EndGlobalSection)
$searchText = "`tEndGlobalSection`r`nGlobal"
$insertPos = $content.LastIndexOf($searchText)

if ($insertPos -lt 0) {
    Write-Host "Could not find configuration section"
    exit
}

# Insert before EndGlobalSection
$insertBeforePos = $content.LastIndexOf("`tEndGlobalSection", $insertPos)
$newContent = $content.Substring(0, $insertBeforePos) + $newConfigs + $content.Substring($insertBeforePos)

Set-Content -Path $slnPath -Value $newContent -Encoding UTF8 -NoNewline

Write-Host "Configuration entries added successfully"
