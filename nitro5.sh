#!/bin/bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru
sudo pacman -Syu
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo rm /var/lib/pacman/db.lck
pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller-00 off
sudo mv bluetooth /var/lib
sudo pacman --needed --noconfirm -S i3-gaps ttf-roboto-mono ttf-fira-code ttf-nerd-fonts-symbols-2048-em ttf-sazanami ttf-liberation \
	rofi dunst python-pywal firefox git lsd rsync ncurses fftw cmake \
bluez bluez-utils unclutter redshift udiskie udisks2 transmission-cli mpd mpc neovim redshift zsh \
mpv feh fzf yt-dlp unclutter nvidia-open-dkms neovim zip unzip zathura-pdf-poppler\
xorg-server xorg-xinit \
lib32-libglvnd lib32-nvidia-utils lib32-sdl12-compat \
xclip maim isync polybar networkmanager rclone
sudo systemctl enable NetworkManager
chsh -s /usr/bin/zsh
systemctl enable bluetooth.service
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
echo "[multilib]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf

paru -S  cli-visualizer python-pywalfox nsxiv zaread autotiling brillo python-pywalfox linux-xanmod-edge linux-xanmod-edge-headers proton-ge-custom \
autojump pamixer transmission-remote-tui-git sfeed clifm
sudo usermod -aG video $USER
brillo -c -S 1
##autologin
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
# echo "ATTRS{idVendor}==\"152d\", ATTRS{idProduct}==\"2329\", RUN+=\"$HOME/.bin/nyaupdate\"" | sudo tee -a /etc/udev/rules.d/test.rules
echo "[Service]" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart="  | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin $USER - \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "DefaultTimeoutStopSec=1"  | sudo tee -a /etc/systemd/system.conf
echo "SUBSYSTEM==\"power_supply\", ATTR{status}==\"Discharging\", ATTR{capacity}==\"[0-1]\", RUN+=\"/usr/bin/systemctl shutdown\""  | sudo tee -a /etc/udev/rules.d/99-lowbat.rules

##.dots
mkdir $HOME/.config/
mkdir $HOME/Music
mkdir $HOME/.bin
mkdir $HOME/.mozilla
mkdir -p $HOME/.local/share/sounds
mkdir -p $HOME/.local/share/icons/custom/
mkdir -p $HOME/.local/share/applications/
sudo mv bin/transadd /usr/local/bin
#cp -r .config/ $HOME/
mv zshrc $HOME/.zshrc
mv mozilla/* $HOME/.mozilla
mv scripts $HOME/
mv xprofile $HOME/.xprofile
mv Pictures $HOME/
mv bin/* $HOME/.bin
mv xinitrc $HOME/.xinitrc
mv zprofile $HOME/.zprofile
mv config/* $HOME/.config/
mv mbsyncrc $HOME/.mbsyncrc
mv apps/* $HOME/.local/share/applications/
mv icons/* $HOME/.local/share/icons/custom/

#cp .xinitrc $HOME/
#cp .zprofile $HOME/
#cp .bin $HOME/
#cp -r Pictures $HOME/
#cp -r suckless $HOME/
#cp -r Music $HOME/

#mv applications/* $HOME/.local/share/applications
#git clone https://github.com/aesophor/wmderland.git
#cd wmderland && ./build.sh --install
#mkdir -p $HOME/.cache/wal/
#touch $HOME/.cache/wal/colors.Xresources
#ln -sf $HOME/.Xresources  $HOME/.cache/wal/colors.Xresources
#sudo pacman -S steam-native-runtime

##make dwm
#cd ~/suckless/dwm/
#sudo make install
#cd ~/suckless/st/
#sudo make install
#cd ~/suckless/dwmblocks
#sudo make install
#Footer
####
sudo sed -i 's/-linux/-linux-xanmod-edge/g' /boot/loader/entries/*
sudo hwclock -w
cd /usr/share/applications/
sudo rm steam.desktop avahi-discover.desktop bssh.desktop bvnc.desktop lstopo.desktop qv412.desktop qvidcap.desktop
mkdir $HOME/.config/dunst/

# mkdir -p "$HOME/.sfeed/feeds"


cd $HOME/.config/st
make
sudo make install

timedatectl set-timezone Etc/GMT-3


my_array=($HOME/Pictures/*)
wal -i ${my_array[$(( $RANDOM % ${#my_array[@]}))]}
ln -s $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
ln -s $HOME/.cache/wal/zathurarc $HOME/.config/zathura/zathurarc
sudo pywalfox install
sudo xset b off




