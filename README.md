## PXE SERVER

1. Install Ubuntu Server
2. Install dependencies
    A. Ansible
    B. tftp-hpa
3. Pull this repo
4. Run ansible playbooks
5. Setup cron to update Core-OS PXE files daily



>
    sudo rm -rf /etc/default/tftpd-hpa
    echo "TFTP_USERNAME='tftp'" | sudo tee -a /etc/default/tftpd-hpa
    echo "TFTP_DIRECTORY='/srv/'" | sudo tee -a /etc/default/tftpd-hpa
    echo "TFTP_ADDRESS=':69'" | sudo tee -a /etc/default/tftpd-hpa
    echo "TFTP_OPTIONS='--secure'" | sudo tee -a /etc/default/tftpd-hpa