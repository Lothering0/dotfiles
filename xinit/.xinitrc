#!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/dotfiles/xinit/.Xresources
xsetroot -cursor_name left_ptr
exec xmonad
