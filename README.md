## PXE SERVER
---
    
###### This script goes through the following steps:
01. Create banner script to display at login
02. Update software, then install tftpd-hpa and unzip
03. Add scripts to bin
04. Configure tftpd-hpa


05.  Download PXE files
    >   
        cd /srv/
        download-pxe-files

    >
        sudo chown -r tftp:tftp /srv/
        sudo systemctl restart tftpd-hpa
    
---