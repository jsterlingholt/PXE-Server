## PXE SERVER
---
    
###### This script goes through the following steps:
    
1.  Update software and install tftpd-hpa and unzip
    >
        sudo apt update
        sudo apt full-upgrade
        sudo apt install -y tftpd-hpa unzip
        sudo systemctl enable tftpd-hpa
            
2.  Configure tftpd:
    >
        sudo rm -rf /etc/default/tftpd-hpa
        echo "TFTP_USERNAME='tftp'" | sudo tee -a /etcdefault/tftpd-hpa
        echo "TFTP_DIRECTORY='/srv/'" | sudo tee -a /etcdefault/tftpd-hpa
        echo "TFTP_ADDRESS=':69'" | sudo tee -a /etc/defaulttftpd-hpa
        echo "TFTP_OPTIONS='--secure'" | sudo tee -a /etcdefault/tftpd-hpa
    >
        sudo chown tftp:tftp /srv/*
        sudo systemctl restart tftpd-hpa

3.  Download Core OS PXE files
    
    
---


4. Run ansible playbooks
5. Setup cronjob to check for Core-OS update daily/weekly