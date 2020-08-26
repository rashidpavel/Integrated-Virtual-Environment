adduser sysadmin --gecos "Sysadmin MRPlab,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "sysadmin:proxmox" |  chpasswd &&

rm -rf /etc/apt/sources.list.d/pve-enterprise.list && rm -rf /etc/apt/sources.list &&
touch /etc/apt/sources.list &&

echo "deb http://deb.debian.org/debian/ stable-updates main contrib non-free" >> /etc/apt/sources.list &&
echo "deb http://deb.debian.org/debian-security stable/updates main" >> /etc/apt/sources.list &&
echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list &&
echo "deb http://deb.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list &&
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list &&

wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg &&

apt update && apt -y install lsb-release distro-info gnupg apt-transport-https software-properties-common curl &&

apt update && apt -y dist-upgrade && 

#wget http://software.virtualmin.com/gpl/scripts/install.sh && chmod a+x install.sh && ./install.sh -m -f -v &&

#curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

#echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" >> /etc/apt/sources.list &&

wget https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&

dpkg -i pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&

apt update && apt -y install tasksel certbot pantheon pantheon-shell gdm3 xrdp &&

#docker volume create portainer_data &&

#docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer &&

reboot

