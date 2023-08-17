# Author: Aegor 1998  Created: 08/17/2023
# Full Windows set up script

# Making it so all scripts can run
Set-ExecutionPolicy Bypass -Scope Process
# NEED TO ADD A LINE TO TURN THIS OFF AT THE END

# need to create a section to run ameliorated (ameliorated.io)
  # Check version of windows
  # Download ameliorated
  # Download playbooks
    # Make sure to check which AME playbook to download

#Chocolatey Install Script - https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; \
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Program Lists
$programs = @('firefox'
              'thunderbird'
              'birdtray'
              'libreoffice-fresh'
              'steam'
              'epicgameslauncher'
              'goggalaxy'
              '7zip.install'
              'bitwarden'
              'clamav'
              'picotorrent'
              'rustdesk'
)

# Install Loop Statement
# format: choco install program
