 if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then sleep 2 && sh ~/.bin/wrap; fi
export BROWSER=firefox
export PATH=$PATH:/usr/local/bin
export PATH=$HOME/.bin:$PATH
