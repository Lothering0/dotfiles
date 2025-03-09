To set dvorak keymap as default
```sh
sudo localectl set-keymap dvorak

# pc105 or any keyboard type
sudo localectl set-x11-keymap us pc105 dvorak
localectl status
```

To make work changing keyboard layout (Mod-Space), run following command:
```sh
chmod u+x ~/dotfiles/layout_switcher/run.sh
```

After each change run following command:
```sh
xmonad-recompile
```

To make it work run:
```sh
chmod u+x xmonad_recompile.sh
```
