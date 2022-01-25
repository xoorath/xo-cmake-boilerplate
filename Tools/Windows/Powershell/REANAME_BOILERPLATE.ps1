
function Get-PrettyNameToFolderName([string]$prettyName) {
    [bool]$hasCapitalization = $false
    foreach($char in [char[]]$prettyName) {
        if([char]::IsUpper($char) -eq "True") {
            $hasCapitalization = $true
            break
        }
    }

    if(-not $hasCapitalization) {
        return $prettyName.replace(" ", "_")
    }
    return $prettyName.replace(" ", "")
}

[string]$projectName = Read-Host "[Project Name]"
[string]$exeName = Read-Host "[Executable Name]"
[string]$dllName = Read-Host "[Dll Name]"

$projectName = Get-PrettyNameToFolderName $projectName
$exeName = Get-PrettyNameToFolderName $exeName
$dllName = Get-PrettyNameToFolderName $dllName

Write-Host "`nConfirm these values (you can only do this once)"
Write-Host "Project name:`t`t$projectName"
Write-Host "Executable name:`t$exeName"
Write-Host "Dll name:`t`t$dllName"

Write-Host "`nEnsure all related files and folders are closed before proceeding."
$confirmed = Read-Host "(type `"confirm`" to proceed)"

if(-not ($confirmed -eq "confirm"))
{
    Write-Host "Aborting rename process."
    return
}

####################################################################################################

[string]$oldProjName = "ProjectName"
[string]$oldExeName = "ExecutableName"
[string]$oldDllName = "DynamicLibName"

[string[]]$FilesToRename = @(
    "CMakeLists.txt",
    "$oldProjName/$oldExeName/CMakeLists.txt",
    "$oldProjName/$oldExeName/Source/main.cpp",
    "$oldProjName/$oldDllName/CMakeLists.txt"
    "$oldProjName/$oldDllName/Include/$oldDllName/api.h"
    "$oldProjName/$oldDllName/Source/api.cpp"
    "$oldProjName/$oldDllName/Source/api_internal.h"
)

# Project root (back from Tools/Windows/Powershell)
Push-Location "$PSScriptRoot/../../../"

function Rename-Content($filename)
{
    (Get-Content -path $filename -Raw) `
        | ForEach-Object{ $_.replace($oldProjName, $projectName) } `
        | ForEach-Object{ $_.replace($oldProjName.ToUpper(), $projectName.ToUpper()) } `
        | ForEach-Object{ $_.replace($oldExeName, $exeName) } `
        | ForEach-Object{ $_.replace($oldExeName.ToUpper(), $exeName.ToUpper()) } `
        | ForEach-Object{ $_.replace($oldDllName, $dllName) } `
        | ForEach-Object{ $_.replace($oldDllName.ToUpper(), $dllName.ToUpper()) } `
        | Set-Content -Path $filename
}

foreach ($filename in $FilesToRename)
{
    Rename-Content $filename
}

Move-Item "$oldProjName/$oldExeName" "$oldProjName/$exeName"
Move-Item "$oldProjName/$oldDllName/Include/$oldDllName" "$oldProjName/$oldDllName/Include/$dllName"
Move-Item "$oldProjName/$oldDllName" "$oldProjName/$dllName"
Move-Item "$oldProjName" "$projectName"

Pop-Location