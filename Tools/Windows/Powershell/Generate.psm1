function Initialize-WindowsBuild(
    [string]
    [ValidateSet("x64", "x86")]
    $Arch,

    [string]
    [ValidateSet("Debug", "Profile", "Release")]
    $Config
)
{
    Import-Module "./Tools/Windows/Powershell/FindCmake.psm1" -Force

    $cmake = Get-Cmake

    $SolutionDir = "Build/Windows_$Arch"
    
    # Ensure this directory exists
    New-Item $SolutionDir -ItemType Directory -Force
    
    Push-Location $SolutionDir
    
    if($Arch -eq "x64")
    {
        & $cmake "../.." -G "Visual Studio 16 2019" -A x64
    }
    else
    {
        & $cmake "../.." -G "Visual Studio 16 2019" -A Win32
    }
    
    # $SolutionDir
    Pop-Location
}


Export-ModuleMember -Function Initialize-WindowsBuild