
hostnamectl set-hostname mypve.nunumia.xyz --static &&
echo "192.168.100.34 mypve.nunumia.xyz mypve" | tee -a /etc/hosts &&

echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list &&
echo "deb http://deb.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list &&
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list &&
echo "deb https://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list &&

wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg &&
wget https://download.webmin.com/jcameron-key.asc &&
apt-key add jcameron-key.asc &&
apt update && apt -y dist-upgrade && apt -y install lsb-release distro-info gnupg apt-transport-https software-properties-common curl &&

curl https://install.yunohost.org | bash &&

apt update && apt -y install proxmox-ve open-iscsi tasksel synaptic gparted 
apt -y remove network-manager &&
reboot
