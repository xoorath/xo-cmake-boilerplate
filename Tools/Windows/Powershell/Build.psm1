
function New-WindowsBuild(
    [string]
    [ValidateSet("x64", "x86")]
    $Arch,

    [string]
    [ValidateSet("Test", "Debug", "Profile", "Release")]
    $Config
)
{
    Import-Module "./Tools/Windows/Powershell/FindCmake.psm1" -Force
    Import-Module "./Tools/Windows/Powershell/Generate.psm1" -Force

    Initialize-WindowsBuild -Arch $Arch -Config $Config

    $cmake = Get-Cmake

    $SolutionDir = "Build/Windows_$Arch"
    
    & $cmake --build $SolutionDir --config $Config
}


Export-ModuleMember -Function New-WindowsBuild