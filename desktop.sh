rm -rf /etc/apt/sources.list.d/pve-enterprise.list && rm -rf /etc/apt/sources.list &&
touch /etc/apt/sources.list &&

echo "deb http://deb.debian.org/debian/ stable-updates main contrib non-free" >> /etc/apt/sources.list &&
echo "deb http://deb.debian.org/debian-security stable/updates main" >> /etc/apt/sources.list &&
echo "deb http://ftp.debian.org/debian buster-backports main" >> /etc/apt/sources.list &&
echo "deb http://deb.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list &&

apt update && apt -y dist-upgrade && apt -y install lsb-release distro-info gnupg apt-transport-https software-properties-common curl &&


wget http://software.virtualmin.com/gpl/scripts/install.sh && chmod a+x install.sh && ./install.sh -m -b -f -v &&

DEBIAN_FRONTEND=noninteractive apt-get -y install freedombox &&

wget https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&

dpkg -i pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&

apt update && apt -y install tasksel pantheon pantheon-shell pantheon-extras lightdm xrdp gparted build-essential
