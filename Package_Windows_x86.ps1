param (
    [string]
    [ValidateSet("Debug", "Profile", "Release")]
    $Config="Debug"
)

Push-Location $PSScriptRoot

Import-Module "./Tools/Windows/Powershell/Package.psm1" -Force

try {
    New-Package -Arch "x86" -Config $Config    
}
catch {
    Write-Host "An error occurred:"
    Write-Host $_ 
}

Pop-Location