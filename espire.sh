#!/bin/bash
# Installing Chaotic AUR
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo mv pacman.conf /etc/
sudo pacman --noconfirm -Syu

# Instaling packagess
sudo pacman --needed --noconfirm -S - < native.txt xf86-video-vesa libva-intel-driver


paru --needed --noconfirm -S - < paru.txt grub-silent

# Disabeling random MAC
sudo mkdir /etc/NetworkManager
sudo mv NetworkManager.conf /etc/NetworkManager/
# Instaling packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo systemctl enable NetworkManager
# sudo systemctl enable bluetooth.service

sudo usermod -aG video $USER
brillo -c -S 1
chsh -s /usr/bin/zsh
##autologin
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
# echo "ATTRS{idVendor}==\"152d\", ATTRS{idProduct}==\"2329\", RUN+=\"$HOME/.bin/nyaupdate\"" | sudo tee -a /etc/udev/rules.d/test.rules
echo "[Service]" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart="  | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin $USER - \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf

# For systemd short timer
echo "timeout 1" | sudo tee /boot/loader/loader.conf

##.dots
mkdir $HOME/.config/
mkdir $HOME/Downloads
mkdir $HOME/Music
mkdir $HOME/.bin
mkdir -p $HOME/.local/share/sounds
mkdir -p $HOME/.local/share/icons/custom/
mkdir -p $HOME/.local/share/applications/
mkdir $HOME/.config/dunst/
mkdir $HOME/.config/zathura/

sudo mv bin/transadd /usr/local/bin
mv zshrc $HOME/.zshrc
mv scripts $HOME/
mv Pictures $HOME/
mv bin/* $HOME/.bin
mv zprofile $HOME/.zprofile
mv config/* $HOME/.config/
mv apps/* $HOME/.local/share/applications/
mv icons/* $HOME/.local/share/icons/custom/

sudo timedatectl set-timezone Etc/GMT-2

my_array=($HOME/Pictures/*)

wal -i ${my_array[$(( $RANDOM % ${#my_array[@]}))]}

# setup for links
ln -fs $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
ln -fs $HOME/.cache/wal/config_waybar $HOME/.config/waybar/config
ln -fs $HOME/.cache/wal/zathurarc $HOME/.config/zathura/zathurarc
ln -fs $HOME/.cache/wal/colors.css $HOME/.config/firefox/chrome/styles/colors.css

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
sed -i 's/background.*//g' ~/.local/share/nvim/site/pack/packer/start/pywal.nvim/lua/pywal/core.lua
color=$(sed '5!d' ~/.cache/wal/colors)
for i in $HOME/.local/share/icons/custom/*; do
sed -i "s/fill=\".*\"/fill=\"$color\"/g" "$i"
done
reboot
