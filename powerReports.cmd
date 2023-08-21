# Author: Aegor1998  Created: 08/21/2023
#This script creates 3 reports and moves them to the desktop

#Creating the folder in which all of the reports will be found
mkdir c:\powercfgReports

powercfg /energy
move C:\windows\system32\energy-report.html c:\powercfgReports\energy-report.html
  
powercfg /systempowerreport
move C:\windows\system32\sleepstudy-report.html c:\powercfgReports\sleepstudy-report.html

#Will not run if there is no battery
powercfg /batteryreport
move C:\windows\system32\battery-report.html c:\powercfgReports\battery-report.html
