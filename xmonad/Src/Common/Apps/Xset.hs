module Src.Common.Apps.Xset (Xset (..)) where

import           Src.Common.Utils.App (App (..))


data Xset = Xset

instance App Xset where
    appCommand _ = "xset"

    -- | Set keyboard delay to 220 ms and repeat rate to 30
    appRun app   = appCommand app ++ " r rate 220 30"
