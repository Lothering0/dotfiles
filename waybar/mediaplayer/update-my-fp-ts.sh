source ../.env
cd $MY_FP_TS_PATH
npm run build
rm --recursive --force ~/dotfiles/waybar/mediaplayer/my-fp-ts
cp --recursive dist ~/dotfiles/waybar/mediaplayer/my-fp-ts
