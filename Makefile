export PATH := ${HOME}/.local/bin:${HOME}/.node_modules/bin:${HOME}/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin/core_perl:${HOME}/bin:${HOME}/google-cloud-sdk/bin
export GOPATH := ${HOME}

PACKAGES	:= wlsunset thunar firefox bat arc-gtk-theme networkmanager adobe-source-han-sans-jp-fonts
PACKAGES	+= starship dunst foot fzf gcc gettext git grep groff gzip lsd lua-language-server
PACKAGES	+= make neovim pamixer papirus-icon-theme python-pywal ripgrep rsync sed shellcheck tree
PACKAGES	+= unzip wl-clipboard zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting
PACKAGES	+= qt5-wayland udiskie mpv npm transmission-cli

AUR_PKGS	:= python-spotdl hyprpaper-git rofi-games bat-extras cli-visualizer cmake git hyprland
AUR_PKGS	+= hyprpaper-git intel-ucode yt-dlp-git ttf-fira-code ttf-liberation ttf-twemoji ttf-nerd-fonts-hack-complete-git
AUR_PKGS	+= ttf-roboto-mono waybar-hyprland zaread-git zathura-pdf-poppler rofi-lbonn-wayland-git libnotify
AUR_PKGS	+= mpvpaper xpub transg-tui-git python-pywalfox grimblast-git  bibata-cursor-theme-bin 


PACMAN		:= sudo pacman --needed --noconfirm -S 
SYSTEMD_ENABLE	:= sudo systemctl --now enable

.DEFAULT_GOAL := help
.PHONY: all allinstall nextinstall allupdate allbackup

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: allinstall nextinstall allupdate allbackup

${HOME}/.local:
	mkdir -p $<

nologin:
	sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
	echo "[Service]" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
	echo "ExecStart="  | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
	echo "ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin $USER - \$TERM" | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf

chaoticarch:
	sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
	sudo pacman-key --lsign-key FBA220DFC880C036
	sudo pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'	sudo mv pacman.conf /etc/
brillo: ## brigtness management
	$(PACMAN) $@
	sudo usermod -aG video $USER
	brillo -c -S 1
zsh:
	$(PACMAN) $@
	chsh -s /usr/bin/zsh
rclone: ## Init rclone
	$(PACMAN) $@
	chmod 600 ${PWD}/.config/rclone/rclone.conf
	cp -r ${PWD}/.config/rclone ${HOME}/.config/rclone

install: ## Install arch linux packages using pacman
	$(PACMAN) $(PACKAGES)


pipinstallarch: ## Install python packages
	$(PACMAN) python-pip

makedir:
	mkdir ${HOME}/.config/
	mkdir ${HOME}/Downloads
	mkdir ${HOME}/Music
	mkdir ${HOME}/.bin
	mkdir ${HOME}/.icons
	mkdir -p ${HOME}/.local/share/sounds
	mkdir -p ${HOME}/.local/share/icons/custom/
	mkdir -p ${HOME}/.local/share/applications/
	mkdir ${HOME}/.config/dunst/
	mkdir ${HOME}/.config/zathura/
	mkdir ${HOME}/.mozilla/
	sudo mv bin/transadd /usr/local/bin
	sudo mv rules/* /etc/udev/rules.d/
	sudo mv hooks/* /etc/pacman.d/hooks/
	cp zshrc ${HOME}/.zshrc
	cp scripts ${HOME}/
	#cp Pictures ${HOME}/
	cp bin/* ${HOME}/.bin
	cp zprofile ${HOME}/.zprofile
	cp config/* ${HOME}/.config/
	cp apps/* ${HOME}/.local/share/applications/
	cp share/* ${HOME}/.local/share/icons/
	cp cusror/* ${HOME}/.icons/

alacritty: ## Init alacritty
	$(PACMAN) $@
	test -L ${HOME}/.config/$@/$@.yml || rm -rf ${HOME}/.config/$@/$@.yml
	ln -vsf {${PWD},${HOME}}/.config/$@/$@.yml

wal:
	$(PACMAN) $@
	wal -n -q -i ${PWD}/Image.png 
	ln -vsfn ${HOME}/.cache/wal/dunstrc ${HOME}/.config/dunst/dunstrc
	ln -vsfn ${HOME}/.cache/wal/starship ${HOME}/.config/starship.toml
	ln -vsfn ${HOME}/.cache/wal/config_waybar ${HOME}/.config/waybar/config
	ln -vsfn ${HOME}/.cache/wal/zathurarc ${HOME}/.config/zathura/zathurarc
	ln -vsfn ${HOME}/.cache/wal/colors.css ${HOME}/.config/firefox/chrome/styles/colors.css

gtk-theme: ## Set gtk theme
	$(PACMAN) gnome-themes-extra arc-gtk-theme

pipewire-pulse: ## Install pipewire-pulse
	$(PACMAN) pipewire-pulse


ttf-cica: ## Install Cica font
	yay -S $@


.ONESHELL:
paru:
	$(PACMAN) $@
	sudo mv paru.conf /etc/

aur: ## Install arch linux AUR packages using paru
	paru --needed --noconfirm -S $(AUR_PKGS)


bluetooth: # Setup bluetooth for AS801 by AfterShokz
	$(PACMAN) bluez bluetuith-bin 
	$(SYSTEMD_ENABLE) bluetooth.service

.ONESHELL:
SHELL = /bin/bash


update: ## Update arch linux packages and save packages cache 3 generations
	paru -Syu

testpath: ## Echo PATH
	PATH=$$PATH
	@echo $$PATH
	GOPATH=$$GOPATH
	@echo $$GOPATH

allinstall: nologin mkdir chaoticarch install paru aur wal brillo zsh bluetooth

allupdate: update
