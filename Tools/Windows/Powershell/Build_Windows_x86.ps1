param (
    [string]
    [ValidateSet("Test", "Debug", "Profile", "Release")]
    $Config="Debug"
)

# Project root (back from Tools/Windows/Powershell)
Push-Location "$PSScriptRoot/../../../"

Import-Module "./Tools/Windows/Powershell/Build.psm1" -Force

New-WindowsBuild -Arch "x86" -Config $Config

# $PSScriptRoot
Pop-Location