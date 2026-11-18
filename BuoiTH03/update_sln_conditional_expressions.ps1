$slnPath = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03\BTH03.sln"
$lines = @(Get-Content $slnPath)

# Find the line after last "Simplifying Conditionals" project
$insertIndex = -1
for ($i = $lines.Count - 1; $i -ge 0; $i--) {
    if ($lines[$i] -match 'Simplifying Conditionals' -and $lines[$i] -match 'EndProject') {
        $insertIndex = $i
        break
    }
}

if ($insertIndex -lt 0) {
    Write-Host "Could not find insertion point"
    exit
}

Write-Host "Insertion point found at line $($insertIndex + 1)"

# Create new project entries with proper GUIDs
$newProjects = @(
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments", "Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments\Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments.csproj", "{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Remove Control Flag", "Simplifying Conditional Expressions_Remove Control Flag\Simplifying Conditional Expressions_Remove Control Flag.csproj", "{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses", "Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses\Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses.csproj", "{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Introduce Assertion", "Simplifying Conditional Expressions_Introduce Assertion\Simplifying Conditional Expressions_Introduce Assertion.csproj", "{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}"',
    'EndProject'
)

# Insert new projects
$lines = $lines[0..$insertIndex] + $newProjects + $lines[($insertIndex+1)..($lines.Count-1)]

# Write back to file
Set-Content -Path $slnPath -Value $lines -Encoding UTF8

Write-Host "Solution file updated successfully with 4 new projects"
