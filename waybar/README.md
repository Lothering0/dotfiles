# Install
Clone [my-fp-ts](https://github.com/Lothering0/my-fp-ts) repository to any directory:
```sh
git clone https://github.com/Lothering0/my-fp-ts
cd my-fp-ts
npm ci
```

Then in the waybar directory copy .env file from .env.example and set path to my-fp-ts project to shell variable:
```sh
cp .env.example .env
cd mediaplayer
chmod u+x update-my-fp-ts.sh
./update-my-fp-ts.sh
npm ci
npm run build
```

# How to test styles with GTK inspector
```sh
GTK_DEBUG=interactive waybar -c ~/dotfiles/waybar/config.jsonc -s ~/dotfiles/waybar/style.css
```
