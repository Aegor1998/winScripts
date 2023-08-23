# Author: Aegor1998  Created: 08/17/2023
# This script will check for corrupt files on a system

# Running this because where DISM pulls from is controlled
# by Group Policy
gpupdate /force
# Updates the what sfc will check against
DISM.exe /Online /Cleanup-image /Restorehealth
# Does the actual repair
sfc /scannow
#NOT TESTED YET
#checks all disks on the computer on next boot
chkntfs /c 
# Reboot Computer
shutdown /r
