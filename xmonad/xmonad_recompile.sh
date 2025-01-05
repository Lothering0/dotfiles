#!/bin/zsh

rm -rf ~/dotfiles/xmonad/lib &&
mkdir ~/dotfiles/xmonad/lib &&
cp -R ~/dotfiles/xmonad/Src ~/dotfiles/xmonad/lib &&
xmonad --recompile &&
rm -rf ~/dotfiles/xmonad/lib
