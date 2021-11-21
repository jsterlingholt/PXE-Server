#!/bin/bash
#   ----------------------------------------
mkdir ~/.bin
mv ~/pxe-server ~/.bin
echo 'PATH=$PATH:~/.bin/pxe-server' >> ~/.bashrc

echo 'Setting login banner'
./~/.bin/scripts/set-banner.sh


#   ----------------------------------------
echo "

downloading Core OS
----------------------------------------

"
cd /srv/
core-os.sh


echo "set up cron to update Core OS files"