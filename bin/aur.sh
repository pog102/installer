#!/usr/bin/env bash

pkgs="
brillo
cli-visualizer
swww
ttf-nerd-fonts-hack-complete-git
zaread-git
rofi-lbonn-wayland-git
bluetuith-bin
transg-tui-git
grimblast-git
grimblast-git
bibata-cursor-theme-bin
"
for k in $pkgs
do
   git clone "https://aur.archlinux.org/$k.git"
   cd $k
   makepkg
   mv *.zst ../local/repo
   cd ..
   rm -rf $k
done
repo-add local/repo/custom.db.tar.gz local/repo/*.zst
