
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

[string]$projectName = Read-Host "[Project Name (pretty)]"
[string]$exeName = Read-Host "[Executable Name (pretty)]"
[string]$dllName = Read-Host "[Dll Name (pretty)]"

[string]$projectFolder = Get-PrettyNameToFolderName $projectName
[string]$exeFolder = Get-PrettyNameToFolderName $exeName
[string]$dllFolder = Get-PrettyNameToFolderName $dllName

Write-Host "`nConfirm these values (you can only do this once)"
Write-Host "Project name:`t`t$projectName`nDirectory:`t`t$projectFolder"
Write-Host "Executable name:`t$exeName`nDirectory:`t`t$exeFolder"
Write-Host "Dll name:`t`t$dllName`nDirectory:`t`t$dllFolder"

$confirmed = Read-Host "(type `"confirm`" to proceed)"

if(-not ($confirmed -eq "confirm"))
{
    Write-Host "Aborting rename process."
    return
}

Write-Host "todo: rename directories, files and file content."

####################################################################################################

[string]$oldProjName = "ProjectName"
[string]$oldExeName = "ExecutableName"
[string]$oldDllName = "DynamicLibName"

[string[]]$FilesToRename = @(
    "CMakeLists.txt",
    "$oldProjName/$oldExeName/CMakeLists.txt",
    "$oldProjName/$oldDllName/CMakeLists.txt"
)
