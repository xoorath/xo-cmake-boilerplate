
Install-Module VSSetup -Scope CurrentUser

# Attempts to get a cmake executable. 
# If it's found at the system path, that cmake may be used (returning "cmake")
# If visual studio is found and has a copy of cmake, that version may be used (returning a literal path to that cmake exe)
# Failing those options an exception will be thrown with instructions to install cmake.
function Get-Cmake()
{
    Push-Location $PSScriptRoot

    [bool]$cmakeExists = (Get-Command -ErrorAction Ignore -Type Application cmake)

    if($cmakeExists) {
        Pop-Location
        return "cmake"
    }
    
    $VSInstallPath = Get-VSSetupInstance | Select-VsSetupInstance -Version '16.0' | Select-Object -ExpandProperty InstallationPath

    Write-Host "VS Install Path: $VSInstallPath`n"
    if([string]::IsNullOrWhiteSpace($VSInstallPath) -or -not (Test-Path $VSInstallPath)) {
        # the fact we couldn't find visual studio isn't important, that was just a means to an end.
        # just notify user they need cmake.
        throw "Get-Cmake Error 1: Cmake not installed. Please install cmake.`nhttps://cmake.org/install/"
    }

    [string]$cmakePath = "$VSInstallPath\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
    
    Write-Host "Cmake Install Path: $cmakePath`n"
    if([string]::IsNullOrWhiteSpace($cmakePath) -or -not (Test-Path $cmakePath)) {
        # Same as above, just notify the user they need cmake. This branch just means we couldn't find it alongside visual studio.
        throw "Get-Cmake Error 2: Cmake not installed. Please install cmake.`nhttps://cmake.org/install/"
    }
    
    Pop-Location
    return $cmakePath
}

Export-ModuleMember -Function Get-Cmake