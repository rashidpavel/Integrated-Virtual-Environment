adduser sysadmin --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "sysadmin:proxmox" |  chpasswd &&

apt update && apt -y install lsb-release distro-info gnupg apt-transport-https software-properties-common &&
wget https://github.com/rashidpavel/Integrated-Virtual-Environment/archive/master.zip &&
unzip master.zip && cd Integrated-Virtual-Environment-master/ &&
rm -rf /etc/apt/sources.list.d/pve-enterprise.list &&
rm -rf /etc/apt/sources.list && cp -r sources.list /etc/apt/sources.list &&
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg &&

apt update && apt -y dist-upgrade && 

wget http://software.virtualmin.com/gpl/scripts/install.sh && chmod a+x install.sh && ./install.sh -m -f -v &&

apt -y install tasksel docker.io tasksel certbot

