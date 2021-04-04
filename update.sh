#!/bin/bash

cp ~/.bashrc ./bashrc
cp ~/.vimrc ./vimrc
cp -r ~/.config/i3 ./i3
cp -r ~/.config/i3blocks ./i3blocks
cp -r ~/.config/qutebrowser ./qutebrowser
cp -r ~/Pictures/wallpapers ./Pictures/wallpapers

git add .
git commit -m"update"
git push

