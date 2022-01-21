param (
    [string]
    [ValidateSet("Debug", "Profile", "Release")]
    $Config="Debug"
)

Push-Location $PSScriptRoot

Import-Module "./Tools/Windows/Powershell/Build.psm1" -Force

New-WindowsBuild -Arch "x86" -Config $Config

# $PSScriptRoot
Pop-Location