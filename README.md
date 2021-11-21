## PXE SERVER
---

1.  Install Ubuntu Server
2. Pull this repo
    >
        git clone https://github.com/jsterlingholt/homelab-cluster

3.  Run Post-Install Script
    >
        cd homelab-cluster
        ./scripts/post-install.sh
    ---

    ###### This script goes through the following steps:
    
    
    1.  Update software and install 
        >
            sudo apt update
            sudo apt full-upgrade

    2.  Configure tftpd:
        >
            sudo rm -rf /etc/default/tftpd-hpa
            echo "TFTP_USERNAME='tftp'" | sudo tee -a /etc/default/tftpd-hpa
            echo "TFTP_DIRECTORY='/srv/'" | sudo tee -a /etc/default/tftpd-hpa
            echo "TFTP_ADDRESS=':69'" | sudo tee -a /etc/default/tftpd-hpa
            echo "TFTP_OPTIONS='--secure'" | sudo tee -a /etc/default/tftpd-hpa
    
    3.  Pull meow
        >
            cd /srv/
            
    ---


4. Run ansible playbooks
5. Setup cronjob to check for Core-OS update daily/weekly