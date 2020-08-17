adduser sysadmin --gecos "Sysadmin MRPlab,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "sysadmin:proxmox" |  chpasswd &&

apt update && apt -y install lsb-release distro-info gnupg apt-transport-https software-properties-common curl &&
rm -rf /etc/apt/sources.list.d/pve-enterprise.list &&
rm -rf /etc/apt/sources.list && cp -r sources.list /etc/apt/sources.list &&

wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg &&

apt update && apt -y dist-upgrade && 

wget http://software.virtualmin.com/gpl/scripts/install.sh && chmod a+x install.sh && ./install.sh -m -f -v &&

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" >> /etc/apt/sources.list &&

apt update && apt -y install docker-ce tasksel certbot gnome gdm3 xrdp &&

docker volume create portainer_data &&

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer &&

reboot

