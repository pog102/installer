#!/bin/bash
sudo rm /var/lib/pacman/db.lck
pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller-00 off
sudo mv bluetooth /var/lib
sudo pacman -S ttf-roboto-mono ttf-fira-code ttf-nerd-font ttf-sazanami ttf-liberation \
	rofi dunst python-pywal firefox git lsd rsync ncurses fftw cmake \
bluez bluez-utils unclutter redshift udiskie udisks2 transmission-cli mpd mpc neovim redshift zsh \
sxiv mpv feh fzf yt-dlp unclutter nvidia-dkms neovim \
xclip maim alacritty polybar networkmanager
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
sudo pacman -Syu
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru
paru -S  cli-visualizer brillo python-pywalfox linux-xanmod-edge linux-xanmod-edge-headers proton-ge-custom \
autojump pamixer transmission-remote-tui-git sfeed
sudo usermod -aG video $USER
brillo -c -S 1
##autologin
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "[Service]" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart="  | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin $USER - \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
##dots
mkdir $HOME/.config/
mkdir $HOME/.bin
sudo mv bin/transadd /usr/local/bin
#cp -r .config/ $HOME/
mv zshrc $HOME/.zshrc
mv xprofile $HOME/.xprofile
mv Pictures $HOME/
mv bin/* $HOME/.bin
mv xinitrc $HOME/.xinitrc 
mv zprofile $HOME/.zprofile
mv config/* $HOME/.config/
#cp .xinitrc $HOME/
#cp .zprofile $HOME/
#cp .bin $HOME/
#cp -r Pictures $HOME/
#cp -r suckless $HOME/
#cp -r Music $HOME/
mv applications/* $HOME/.local/share/applications
git clone https://github.com/aesophor/wmderland.git
cd wmderland && ./build.sh --install
mkdir -p $HOME/.cache/wal/
touch $HOME/.cache/wal/colors.Xresources
ln -sf $HOME/.Xresources  $HOME/.cache/wal/colors.Xresources
sudo pacman -S steam-native-runtime
##make dwm
#cd ~/suckless/dwm/
#sudo make install
#cd ~/suckless/st/
#sudo make install
#cd ~/suckless/dwmblocks
#sudo make install
#Footer
sudo sed -i 's/-linux/-linux-xanmod-edge/g' /boot/loader/entries/*
sudo hwclock -w
cd /usr/share/applications/
sudo rm steam.desktop avahi-discover.desktop bssh.desktop bvnc.desktop lstopo.desktop qv412.desktop qvidcap.desktop
mkdir $HOME/.config/dunst/
ln -s $HOME/.config/dunst/dunstrc $HOME/.cache/wal/dunstrc 
mkdir -p $HOME/.local/share/icons/custom/
mkdir -p "$HOME/.sfeed/feeds"

my_array=($HOME/Pictures/*)
wal -i ${my_array[$(( $RANDOM % ${#my_array[@]}))]}
ls -s $HOME/.cache/wal/alacritty.yml $HOME/.config/alacritty/alacritty.yml



