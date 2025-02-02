module Src.Common.Apps.Kitty (Kitty (..)) where

import           Src.Common.Utils.App (App (..))


data Kitty = Kitty

instance App Kitty where
    appCommand _ = "kitty"
