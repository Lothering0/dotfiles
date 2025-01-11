```sh
mkdir -p ~/.config/systemd
ln -s ~/dotfiles/systemd/user ~/.config/systemd
```

Then start services:
```sh
systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service
systemctl --user status kanata.service   # check whether the service is running
```
