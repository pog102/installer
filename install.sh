#!/bin/bash
sudo rm /var/lib/pacman/db.lck
sudo pacman -S ttf-hack ttf-roboto ttf-sazanami ttf-jetbrains-mono ttf-liberation \
	rofi dunst python-pywal firefox git lsd rsync ncurses fftw cmake \
bluez bluez-utils unclutter redshift udiskie udisks2 transmission-cli mpd mpc neovim redshift zsh \
sxiv mpv xwallpaper fzf yt-dlp unclutter nvidia-dkms \
xclip maim kitty polybar autojump
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
paru -S  cli-visualizer brillo python-pywalfox linux-xanmod-edge linux-xanmod-edge-headers proton-ge-custom
sudo usermod -aG video $USER
##autologin
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo touch /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "[Service]" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart="  | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin $USER - \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
##dots
mkdir $HOME/.config/
#cp -r .config/ $HOME/
mv zshrc $HOME/.zshrc
mv xinitrc $HOME/.xinitrc 
mv zprofile $HOME/.zprofile
mv config/ $HOME/.config/
#cp .xinitrc $HOME/
#cp .zprofile $HOME/
#cp .bin $HOME/
#cp -r Pictures $HOME/
#cp -r suckless $HOME/
#cp -r Music $HOME/
git clone https://github.com/aesophor/wmderland.git
cd wmderland && ./build.sh --install
mkdir -p ~/.config/wmderland
cp /etc/xdg/wmderland/config ~/.config/wmderland/.
echo "bindsym \$Mod+Return exec kitty" >> ~/.config/wmderland/config
echo "exec wmderland" > ~/.xinitrc
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

