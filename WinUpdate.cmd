# Author: Aegor1998    Created: 09/23/2023
# Push Remote Updates
# Stage 1: Make sure that powershell is set up to deal with Windows Update (silently)
# Stage 2: Implement Windows Update (Auto Accept All)
# Stage 3: Make sure that powershell is set up to deal with Dell Update (silently)
# Stage 4: Implement Dell Update (Auto Accept All)
# Stage 5: Make sure that powershell is set up to deal with Winget (silently)
# Stage 6: Check for the following apps and update if found (Java 8, Adobe Reader, Zoom)
# Stage 7: Remove forbidden programs using a list
# Stage 8: Check if Company Portal is installed (silently install)
  # User will need to log in and sync

# Clears all Variables
Remove-Variable * -ErrorAction SilentlyContinue
# Install Nuget
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Stage 1 
Install-Module PSWindowsUpdate -Confirm:$False -Force
Get-Command -Module WindowsUpdateProvider

# Stage 2 #need to test
$Updates = Start-WUscan -SearchCriteria "Type='Software' AND IsInstalled=0"
Get-WindowsUpdate -AcceptAll -Install

# Stage 3 !ONLY WILL RUN ON MACHINES WITH DELL COMMAND INSTALLED!
if(Get-AppxPackage -AllUsers | Select-String "dcu-cli"){ #Need to test if this works
  # Stage 4
  dcu-cli.exe /scan -silent
  dcu-cli.exe /applyUpdates -silent
}

# Stage 5
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

# Stage 6
