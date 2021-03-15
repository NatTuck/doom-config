#!/bin/bash
wget -q http://emacs.ganneff.de/apt.key -O- | sudo apt-key add
sudo add-apt-repository "deb http://emacs.ganneff.de/ buster main"
sudo apt-get update
sudo apt remove emacs emacs-gtk emacs-common
sudo apt autoremove
sudo apt install emacs-snapshot
