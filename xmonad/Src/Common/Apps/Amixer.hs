module Src.Common.Apps.Amixer (Amixer (..)) where

import           Src.Common.Utils.App (App (..))


data Amixer = Amixer

instance App Amixer where
    appCommand _ = "amixer"

    -- | Set volume to 80%
    appRun app   = appCommand app ++ " set Master 80%"
