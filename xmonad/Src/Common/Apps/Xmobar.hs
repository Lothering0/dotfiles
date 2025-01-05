module Src.Common.Apps.Xmobar (Xmobar (..)) where
import           Src.Common.Utils.App (App (..))


data Xmobar = Xmobar

instance App Xmobar where
    appCommand = const "xmobar"

    appRun app = appCommand app ++ " ~/dotfiles/xmobar/.xmobarrc"
