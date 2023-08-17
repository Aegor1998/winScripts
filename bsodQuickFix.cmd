# This script will run through some common fixes for BSOD
# This 

# Updates the what sfc will check against
DISM.exe /Online /Cleanup-image /Restorehealth
# Does the actual repair
sfc /scannow
# This line keeps the terminal open
cmd /k
shutdown /r
