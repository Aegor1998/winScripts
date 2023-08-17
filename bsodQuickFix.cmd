# This script will run through some common fixes for BSOD
# This 

# Updates the what sfc will check against
DISM.exe /Online /Cleanup-image
# Does the actual repair
sfc /scannow | Write-Ouput
