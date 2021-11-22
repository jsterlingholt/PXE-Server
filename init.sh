#!/bin/bash
#   ----------------------------------------
#   1.  Create banner script to display at login
echo 'Setting login banner'
sudo touch /etc/profile.d/login.sh
sudo chmod +x /etc/profile.d/login.sh
sudo echo "echo '
    ____ _  __ ______   _____ __________ _    _____________
   / __ \ |/ // ____/  / ___// ____/ __ \ |  / / ____/ __  ]
  / /_/ /   // __/     \__ \/ __/ / /_/ / | / / __/ / /_/ /
 / ____/   |/ /___    ___/ / /___/ _, _/| |/ / /___/ _, _/ 
/_/   /_/|_/_____/   /____/_____/_/ |_| |___/_____/_/ |_|                                                 
'" >> /etc/profile.d/login.sh

#   ----------------------------------------
#   2.  Update software, then install tftpd-hpa and unzip
sudo echo "updating software"
sudo apt update
sudo apt full-upgrade
sudo echo "installing tftpd-hpa and unzip"
sudo apt install tftpd-hpa unzip -y
sudo systemctl enable tftpd-hpa

#   ----------------------------------------
#   3.  Configure tftpd-hpa
sudo rm -rf /etc/default/tftpd-hpa
sudo echo "TFTP_USERNAME='tftp'" | sudo tee -a /etc/default/tftpd-hpa
sudo echo "TFTP_DIRECTORY='/srv/'" | sudo tee -a etc/default/tftpd-hpa
sudo echo "TFTP_ADDRESS=':69'" | sudo tee -a /etc/default/tftpd-hpa
sudo echo "TFTP_OPTIONS='--secure'" | sudo tee -a etc/default/tftpd-hpa

#   ----------------------------------------
#   4. Add scripts to bin
sudo echo 'PATH=$PATH:~/.bin/pxe-server' >> ~/.bashrc


