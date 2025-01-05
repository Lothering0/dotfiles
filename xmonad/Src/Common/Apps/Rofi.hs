module Src.Common.Apps.Rofi (Rofi (..)) where

import           Src.Common.Utils.App (App (..))


data Rofi = Rofi

instance App Rofi where
    appCommand = const "rofi"

    appRun app = appCommand app ++ " -show drun -config ~/dotfiles/rofi/rofi.rasi"
