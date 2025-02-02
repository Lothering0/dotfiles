module Src.Common.Apps.Xmobar (Xmobar (..)) where
import           Src.Common.Utils.App (App (..))


pathToConfig :: String
pathToConfig = "~/dotfiles/xmobar/xmobar.hs"

data Xmobar = Xmobar

instance App Xmobar where
    appCommand _ = "xmobar"

    appRun app   = appCommand app ++ " " ++ pathToConfig
