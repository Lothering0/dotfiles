#!/bin/zsh

local is_hyprland_session=

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  is_hyprland_session=true
fi

function x11__get_current_layout() {
  echo $(setxkbmap -query | grep layout | awk '{print $2}')
}

function hyprland__get_current_layout() {
  echo $(hyprctl devices -j |
    jq -r '.keyboards[] | .active_keymap' |
    tail -n1 |
    cut -c1-2 |
    tr 'A-Z' 'a-z')
}

function get_current_layout() {
  if [[ $is_hyprland_session ]]; then
    echo $(hyprland__get_current_layout)
  else
    echo $(x11__get_current_layout)
  fi
}

function notify_about_switch() {
  local current_layout=$(get_current_layout | tr 'a-z' 'A-Z')
  notify-send -u low "Layout changed to $current_layout" -t 2000
}

function x11__switch_layout() {
  if [[ -n "$1" ]]; then
    setxkbmap $1
    return
  fi

  current_layout=$(get_current_layout)
  case $current_layout in
    ru)
      setxkbmap us -v dvorak
    ;;
    *)
      setxkbmap ru
    ;;
  esac
}

function hyprland__switch_layout() {
  if [[ -n "$1" ]]; then
    hyprctl switchxkblayout current $1
  else
    hyprctl switchxkblayout current next
  fi
}

function switch_layout() {
  if [[ $is_hyprland_session ]]; then
    hyprland__switch_layout $1
  else
    x11__switch_layout $1
  fi
}

switch_layout $1
notify_about_switch
