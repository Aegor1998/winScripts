# Author: Aegor1998   Created: 9/22/2023
# Check for "deploymentruleset.jar" and remove if found.


if (Test-Path C:\Windows\Sun){
    powershell -windowstyle hidden -command Remove-Item C:\Windows\sun
}
