#!/bin/bash
sudo sed -i "s/user/$USER/g" hosts
sudo mv bluetooth /var/lib
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
echo "[multilib]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment
sudo pacman --noconfirm -Syu
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo rm /var/lib/pacman/db.lck
pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller-00 off
sudo pacman --needed --noconfirm -S paru libva gnu-free-fonts \
i3-gaps ttf-roboto-mono ttf-fira-code ttf-nerd-fonts-symbols-2048-em ttf-sazanami ttf-liberation \
	rofi dunst python-pywal firefox git lsd rsync ncurses fftw cmake \
bluez bluez-utils unclutter redshift udiskie udisks2 transmission-cli mpd mpc neovim redshift zsh \
mpv feh fzf yt-dlp unclutter nvidia-open-dkms neovim zip unzip zathura-pdf-poppler \
xorg-server xorg-xinit \
lua-language-server npm \
lib32-libglvnd lib32-nvidia-utils lib32-sdl12-compat \
xclip maim isync polybar networkmanager rclone papirus-icon-theme \
zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
sudo systemctl enable NetworkManager
chsh -s /usr/bin/zsh
sudo systemctl enable bluetooth.service

paru --noconfirm -S picom-jonaburg-git cli-visualizer python-pywalfox brillo zaread
paru --noconfirm -S nsxiv xmenu autotiling linux-tkg-pds-generic_v3  linux-tkg-pds-generic_v3-headers proton-ge-custom \
pamixer steam-native-runtime openssl-1.1
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

echo "timeout 1" | sudo tee /boot/loader/loader.conf

##.dots
mkdir $HOME/.config/zathura/
mkdir -p /usr/share/zsh/plugins/
mkdir $HOME/.config/
mkdir $HOME/Downloads
mkdir $HOME/Music
mkdir $HOME/Csharp
mkdir $HOME/.bin
mkdir $HOME/.mozilla
mkdir -p $HOME/.local/share/sounds
mkdir -p $HOME/.local/share/icons/custom/
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.themes/wal/gtk-2.0
sudo mv bin/transadd /usr/local/bin
#cp -r .config/ $HOME/
mv zshrc $HOME/.zshrc
mv moziila/* $HOME/.mozilla
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
mv gtk-2 $HOME/.gtk-2.0
sudo mv hosts /etc/hosts
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
sudo git clone https://github.com/ael-code/zsh-colored-man-pages.git /usr/share/zsh/plugins/zsh-colored-man-pages


sudo sed -i 's/-linux/-linux-tkg-pds-generic_v3/g' /boot/loader/entries/*
sudo hwclock -w
cd /usr/share/applications/
sudo rm steam.desktop avahi-discover.desktop bssh.desktop bvnc.desktop lstopo.desktop qv412.desktop qvidcap.desktop
mkdir $HOME/.config/dunst/

# mkdir -p "$HOME/.sfeed/feeds"


cd $HOME/.config/st
make
sudo make install

sudo timedatectl set-timezone Etc/GMT-2


my_array=($HOME/Pictures/*)
wal -i ${my_array[$(( $RANDOM % ${#my_array[@]}))]}
ln -fs $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
ln -fs $HOME/.cache/wal/zathurarc $HOME/.config/zathura/zathurarc
ln -fs $HOME/.cache/wal/qt.conf $HOME/.config/qt5ct/colors/wal.conf
ln -fs $HOME/.cache/wal/colors.css $HOME/.config/firefox/chrome/styles/colors.css
ln -fs $HOME/.cache/wal/gtkrc $HOME/.themes/wal/gtk-2.0/gtkrc

mpd&
mpc load mylist.m3u
mpc repeat on
mpc random on
mpc single off
mv mylist.m3u ~/Music/
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
sed -i 's/background.*//g' ~/.local/share/nvim/site/pack/packer/start/pywal.nvim/lua/pywal/core.lua
sudo pywalfox install
sudo xset b off
color=$(sed '5!d' ~/.cache/wal/colors)
for i in $HOME/.local/share/icons/custom/*; do
convert $i -fill "$color" -colorize 100 $i
done
export QT_QPA_PLATFORMTHEME=qt5ct
reboot


