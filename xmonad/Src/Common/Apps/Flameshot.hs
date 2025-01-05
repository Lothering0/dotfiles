module Src.Common.Apps.Flameshot (Flameshot (..)) where

import           Src.Common.Utils.App (App (..))


data Flameshot = Flameshot

instance App Flameshot where
    appCommand = const "flameshot"

    -- | Start Flameshot. Flameshot will not copy images to buffer without it
    appInit    = appCommand

    appRun app = appCommand app ++ " gui"
