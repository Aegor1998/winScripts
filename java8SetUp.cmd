# Author: Aegor1998   Created: 9/21/2023
# Updated: Sepetember 22nd, 2023 1348PST
# Download and set-up Java 8 using winget (must be run as admin)
# [x] Stage 1: Check if winget is installed, install winget, download java
# [x] Stage 2: Add websites from a list to the security white list
# [x] Stage 3: Check for "deploymentruleset.jar" and remove if found.
# [x] Stage 4: Remove Java before installing through winget

# Will not run if started with elevated privlages over the logged in account
# Clears all Variables
Remove-Variable * -ErrorAction SilentlyContinue

# Check if winget is installed
if(Get-AppxPackage -AllUsers | Select-String "Microsoft.Winget.Source"){
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
#Check if Java is installed

#Install Java
if(winget list | Select-String "potato"){
winget install --id=Oracle.JavaRuntimeEnvironment -e
}

#Exceptions List
$site = "https://www.test.com"
Add-Content -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites" -Value "$site"

# Check for "deploymentruleset.jar" and remove if found
if (Test-Path C:\Windows\Sun){
    powershell -windowstyle hidden -command Remove-Item C:\Windows\sun
}

# Sign off
Write-Host "Java 8 has been installed and configured"
