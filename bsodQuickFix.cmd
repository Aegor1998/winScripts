# Author: Aegor1998  Created: 08/17/2023
# Link: https://github.com/Aegor1998/winScripts/edit/main/bsodQuickFix.cmd
# Last Update: 08/23/2023 By: Aegor1998
# This script will check for corrupt files on a system

# Running this because where DISM pulls from is controlled
# by Group Policy
gpupdate /force
# Updates the what sfc will check against
DISM.exe /Online /Cleanup-image /Restorehealth
# Does the actual repair
sfc /scannow
#checks all disks on the computer on next boot
chkntfs C: /c 
# Reboot Computer
shutdown /r
