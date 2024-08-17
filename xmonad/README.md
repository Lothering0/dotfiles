To set dvorak keymap as default
```sh
sudo localectl set-keymap dvorak

# pc105 or any keyboard type
sudo localectl set-x11-keymap us pc105 dvorak
localectl status
```

If changing keyboard layout (Mod-Space) not working, run following command:
```sh
chmod u+x layout_switch.sh
```

After each change run following command:
```sh
xmonad --recompile
```

# Useful tools
* **[Yay](https://github.com/Jguer/yay)** - package manager for installing packages from AUR
* **[Dmenu](https://wiki.archlinux.org/title/dmenu)** - programs manager
* **[Rofi](https://github.com/davatorium/rofi)** - programs manager, but better
* **[Dunst](https://wiki.archlinux.org/title/Dunst)** - notifications. Working with [libnotify](https://archlinux.org/packages/extra/x86_64/libnotify/)
* **[Flameshot](https://flameshot.org/)** - takes a screenshot
* **[Nitrogen](https://wiki.archlinux.org/title/nitrogen)** - wallpapers
* **[Picom](https://github.com/yshui/picom)** - compositor for X Window System
* **[Kitty](https://sw.kovidgoyal.net/kitty/)** - terminal emulator
* **[Autokey](https://github.com/autokey/autokey)** - bind Shift-Space to Escape (for VIM purposes)
* **Neovim** - text editor

# Cool packages
* **[Bibata Cursor](https://github.com/ful1e5/Bibata_Cursor)** - cursor theme
* **[Papirus Icon Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)** - icon theme. Lxappearance
* **Lxappearance** - switching icons. lxappearance-gtk3 recommended
* **Neofetch** - system information
* **Bat** - like cat but better
* **Postman** - make API requests
* **Dbeaver** - database manager
* **Obsidian** - notes

# Optional packages
* Aspnet-runtime, dotnet-sdk
