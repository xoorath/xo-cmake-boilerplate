
function New-Package(
    [string]
    [ValidateSet("x64", "x86")]
    $Arch,

    [string]
    [ValidateSet("Test", "Debug", "Profile", "Release")]
    $Config
)
{
    Import-Module "./Tools/Windows/Powershell/Build.psm1" -Force
    New-WindowsBuild -Arch $Arch -Config $Config
    
    $PackageName = "$(get-date -f yyyy-MM-dd) $(get-date -f HH_mm_ss) $Config"
    
    Write-Host $PackageName
    
    New-Item "Package/Windows_$Arch/$PackageName" -ItemType Directory -Force
    
    $excludes = New-Object System.Collections.ArrayList
    
    
    if($Config -eq "Release") {
        $excludes.Add("*.exp")
        $excludes.Add("*.lib")
    }
    
    
    Copy-Item -Path "Build/Windows_$Arch/$Config/*" -Destination "Package/Windows_$Arch/$PackageName/" -Exclude $excludes
    Copy-Item -Path "StartupDir/*" -Destination "Package/Windows_$Arch/$PackageName/"
    
    Compress-Archive -Path "Package/Windows_$Arch/$PackageName/" -DestinationPath "Package/Windows_$Arch/$PackageName" -CompressionLevel "Optimal"
}


Export-ModuleMember -Function New-Package
