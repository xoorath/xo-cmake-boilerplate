param (
    [string]
    [ValidateSet("Debug", "Profile", "Release")]
    $Config="Debug"
)

Push-Location $PSScriptRoot

Import-Module "./Tools/Windows/Powershell/Package.psm1" -Force
New-Package -Arch "x64" -Config $Config

Pop-Location