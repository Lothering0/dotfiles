module Src.Common.Apps.Picom (Picom (..)) where

import           Src.Common.Utils.App (App (..))


-- | Picom, compositor for Xorg
data Picom = Picom

instance App Picom where
    appCommand _ = "picom"

    appRun app   = appCommand app ++ " --config ~/dotfiles/picom/picom.conf"
