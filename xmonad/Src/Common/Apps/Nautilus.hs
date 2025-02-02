module Src.Common.Apps.Nautilus (Nautilus (..)) where

import           Src.Common.Utils.App (App (..))


data Nautilus = Nautilus

instance App Nautilus where
    appCommand _ = "nautilus"
