#!/bin/sh
name=$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p')
[ "$name" == "Intel(R) Core(TM) i5-10300H CPU" ] && sh nitro5.sh || sh espire.sh

