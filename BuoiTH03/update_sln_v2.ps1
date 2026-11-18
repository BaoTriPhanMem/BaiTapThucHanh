$slnPath = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03\BTH03.sln"
$content = Get-Content -Path $slnPath -Raw

# Find where to insert (after last "Introduce Null Object" project)
$searchText = 'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Moving Features between Objects_Introduce Local Extension"'

$insertPos = $content.LastIndexOf($searchText)
if ($insertPos -lt 0) {
    Write-Host "Could not find insertion point"
    exit
}

# Find the end of this project block (EndProject line)
$endProjectPos = $content.IndexOf("EndProject`r`n", $insertPos)
if ($endProjectPos -lt 0) {
    Write-Host "Could not find EndProject"
    exit
}

$insertAfterPos = $endProjectPos + "EndProject`r`n".Length

# New projects to add
$newProjects = @"
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments", "Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments\Simplifying Conditional Expressions_Consolidate Duplicate Conditional Fragments.csproj", "{K1L2M3N4-O5P6-4H7Q-R8S9-T0U1V2W3X4Y5}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Remove Control Flag", "Simplifying Conditional Expressions_Remove Control Flag\Simplifying Conditional Expressions_Remove Control Flag.csproj", "{L2M3N4O5-P6Q7-4I8R-S9T0-U1V2W3X4Y5Z6}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses", "Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses\Simplifying Conditional Expressions_Replace Nested Conditional with Guard Clauses.csproj", "{M3N4O5P6-Q7R8-4J9S-T0U1-V2W3X4Y5Z6A7}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Simplifying Conditional Expressions_Introduce Assertion", "Simplifying Conditional Expressions_Introduce Assertion\Simplifying Conditional Expressions_Introduce Assertion.csproj", "{N4O5P6Q7-R8S9-4K0T-U1V2-W3X4Y5Z6A7B8}"
EndProject
"@

$newContent = $content.Substring(0, $insertAfterPos) + $newProjects + $content.Substring($insertAfterPos)

Set-Content -Path $slnPath -Value $newContent -Encoding UTF8 -NoNewline

Write-Host "Solution file updated successfully"
