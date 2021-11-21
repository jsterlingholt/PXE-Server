#### Install & enable tftp-hpa
>
    sudo apt install -y tftpd-hpa
    sudo systemctl enable tftpd-hpa
    
Change ownership of TFTP directory to TFTP user
>
    sudo chown tftp:tftp /srv/tftp
Create a test file to pull

>   
    echo "hello" | sudo tee /srv/tftp/hello.txt



On a separate machine, connect to TFTP server and request test file:
>
    tftp [ip]
    tftp> get hello.txt

To read the file:
>   cat hello.txt

sudo systemctl restart tftpd-hpa


//ssh-copy-id sammy@your_server_address