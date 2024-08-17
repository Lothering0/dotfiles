#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# switch between my layouts

# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, it, fr].
if [[ -n "$1" ]]; then
  setxkbmap $1
else
  layout=$(setxkbmap -query | awk 'END{print $2}')
  case $layout in
    ru)
      setxkbmap us -v dvorak
      notify-send -u low "Layout changed to US" -t 2000
    ;;
    *)
      setxkbmap ru
      notify-send -u low "Layout changed to RU" -t 2000
    ;;
  esac
fi
