#!/bin/zsh

rm -rf ~/dotfiles/xmobar/lib &&
mkdir ~/dotfiles/xmobar/lib &&
cp -R ~/dotfiles/xmobar/Src ~/dotfiles/xmobar/lib &&
rm -rf ~/dotfiles/xmonad/lib &&
mkdir ~/dotfiles/xmonad/lib &&
cp -R ~/dotfiles/xmonad/Src ~/dotfiles/xmonad/lib &&
xmonad --recompile &&
rm -rf ~/dotfiles/xmonad/lib
