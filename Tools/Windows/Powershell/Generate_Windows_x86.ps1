# Project root (back from Tools/Windows/Powershell)
Push-Location "$PSScriptRoot/../../../"

Import-Module "./Tools/Windows/Powershell/Generate.psm1" -Force

Initialize-WindowsBuild -Arch "x86"

# $PSScriptRoot
Pop-Location