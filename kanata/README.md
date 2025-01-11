https://github.com/jtroo/kanata/wiki/Avoid-using-sudo-on-Linux

```sh
# Add uinput group if it is not exist
sudo groupadd uinput

sudo usermod -aG input,uinput $USER
```

Add a udev in either `/etc/udev/rules.d` or `/lib/udev/rules.d`:
```sh
sudo sh -c "echo 'KERNEL==\"uinput\", MODE=\"0660\", GROUP=\"uinput\", OPTIONS+=\"static_node=uinput\"' > /etc/udev/rules.d/01-kanata.rules"
```

## Make sure the uinput drivers are loaded
```sh
# Should be no output
sudo modprobe uinput
```

## Autoload
To make Kanata load automatically check ~/dotfiles/systemd/README.md
