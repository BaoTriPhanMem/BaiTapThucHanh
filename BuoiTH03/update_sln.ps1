$slnPath = "H:\HK1_26_27\HP_ThietKeBaoTriPM\BTH03\BTH03.sln"
$lines = @(Get-Content $slnPath)

# Find the index of EndProject line after "Organizing Data_Replace Type Code with Class"
$insertIndex = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match 'Organizing Data_Replace Type Code with Class' -and $i -lt $lines.Count - 1) {
        if ($lines[$i+1] -match 'EndProject') {
            $insertIndex = $i + 1
            break
        }
    }
}

if ($insertIndex -lt 0) {
    Write-Host "Could not find insertion point"
    exit
}

Write-Host "Insertion point found at line $($insertIndex + 1)"

# Create new project entries
$newProjects = @(
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Replace Data Value with Object", "Organizing Data_Replace Data Value with Object\Organizing Data_Replace Data Value with Object.csproj", "{A1B2C3D4-E5F6-47G8-H9I0-J1K2L3M4N5O6}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Change Value to Reference", "Organizing Data_Change Value to Reference\Organizing Data_Change Value to Reference.csproj", "{B2C3D4E5-F6G7-48H9-I0J1-K2L3M4N5O6P7}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Change Reference to Value", "Organizing Data_Change Reference to Value\Organizing Data_Change Reference to Value.csproj", "{C3D4E5F6-G7H8-49I0-J1K2-L3M4N5O6P7Q8}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Replace Array with Object", "Organizing Data_Replace Array with Object\Organizing Data_Replace Array with Object.csproj", "{D4E5F6G7-H8I9-4A0J-K1L2-M3N4O5P6Q7R8}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Duplicate Observed Data", "Organizing Data_Duplicate Observed Data\Organizing Data_Duplicate Observed Data.csproj", "{E5F6G7H8-I9J0-4B1K-L2M3-N4O5P6Q7R8S9}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Change Unidirectional Association to Bidirectional", "Organizing Data_Change Unidirectional Association to Bidirectional\Organizing Data_Change Unidirectional Association to Bidirectional.csproj", "{F6G7H8I9-J0K1-4C2L-M3N4-O5P6Q7R8S9T0}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Change Bidirectional Association to Unidirectional", "Organizing Data_Change Bidirectional Association to Unidirectional\Organizing Data_Change Bidirectional Association to Unidirectional.csproj", "{G7H8I9J0-K1L2-4D3M-N4O5-P6Q7R8S9T0U1}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Replace Type Code with Subclasses", "Organizing Data_Replace Type Code with Subclasses\Organizing Data_Replace Type Code with Subclasses.csproj", "{H8I9J0K1-L2M3-4E4N-O5P6-Q7R8S9T0U1V2}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Replace Type Code with State or Strategy", "Organizing Data_Replace Type Code with State or Strategy\Organizing Data_Replace Type Code with State or Strategy.csproj", "{I9J0K1L2-M3N4-4F5O-P6Q7-R8S9T0U1V2W3}"',
    'EndProject',
    'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Organizing Data_Replace Subclass with Fields", "Organizing Data_Replace Subclass with Fields\Organizing Data_Replace Subclass with Fields.csproj", "{J0K1L2M3-N4O5-4G6P-Q7R8-S9T0U1V2W3X4}"',
    'EndProject'
)

# Insert new projects
$lines = $lines[0..$insertIndex] + $newProjects + $lines[($insertIndex+1)..($lines.Count-1)]

# Write back to file
Set-Content -Path $slnPath -Value $lines -Encoding UTF8

Write-Host "Solution file updated successfully with 10 new projects"
