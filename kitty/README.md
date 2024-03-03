# [Kitty](https://github.com/kovidgoyal/kitty) config

## 1. Install Kitty terminal

[How to install](https://sw.kovidgoyal.net/kitty/binary/).

## 2. Config installation

### 2.1. Activate configuration

In ~/.config/kitty/kitty.conf type next line

```kitty
include ~/dotfiles/kitty/kitty.conf
```

Or create a symlink:

```sh
ln -s ~/dotfiles/kitty ~/.config
```

### 2.2. Create constants.conf

```sh
cp ~/dotfiles/kitty/constants.example.conf ~/dotfiles/kitty/constants.conf
```
