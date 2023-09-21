# Author: Aegor1998 Created 9/21/2023
# Download and set-up Java 8 using winget (must be run as admin)
# [x] Stage 1: Check if winget is installed, install winget, download java
# [x] Stage 2: Add websites from a list to the security white list
# [ ] Stage 3: Check for "deploymentruleset.jar" and remove if found

# Check if winget is installed
if(Compare-Object -ReferenceObject (Get-AppxPackage | Select-Object "winget" | Select -First 1) -DifferenceObject ("winget")){
} else {
  # Install winget
  $progressPreference = 'silentlyContinue'
  Write-Information "Downloading WinGet and its dependencies..."
  Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
  Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
  Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
  Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
  Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
  Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}
#Install Java
winget install --id=Oracle.JavaRuntimeEnvironment --silent --accept-package-agreements --accept-source-agreements

#Exceptions List
$site = "https://www.test.com"
Add-Content -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites" -Value "$site"
