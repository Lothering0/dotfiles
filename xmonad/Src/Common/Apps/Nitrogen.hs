module Src.Common.Apps.Nitrogen (Nitrogen (..)) where

import           Src.Common.Utils.App (App (..))


-- | Wallpapers program
data Nitrogen = Nitrogen

instance App Nitrogen where
    appCommand _ = "nitrogen"

    appInit app  = appCommand app ++ " --restore"
