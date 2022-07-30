#!/bin/bash
sudo pacman -Syu --noconfirm ttf-hack ttf-roboto ttf-sazanami ttf-jetbrains-mono \
	rofi dunst python-pywal firefox git lsd rsync ncurses fftw cmake \
    unclutter redshift udiskie udsiks2 transmission-cli mpd mpc

sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
paru -S --noconfirm cli-visualizer proton-ge-custom-bin brillo python-pywalfox
usermod -aG vidoe $USER
##autologin
mkdir /etc/systemd/system/getty@tty1.service.d/
echo "[Service]" >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin username - $TERM" >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
##dots
cp -r .config/ $HOME/
cp .zshrc $HOME/
cp .xprofile $HOME/
cp .xinitrc $HOME/
cp .zprofile $HOME/
cp .bin $HOME/
cp -r Pictures $HOME/
cp -r suckless $HOME/
cp -r Music $HOME/
ln -sf $HOME/.Xresources  $HOME/.cache/wal/colors.Xresources
sudo pacman -S --noconfirm steam
##make dwm
cd ~/suckless/dwm/
sudo make install
cd ~/suckless/st/
sudo make install
cd ~/suckless/dwmblocks
sudo make install
