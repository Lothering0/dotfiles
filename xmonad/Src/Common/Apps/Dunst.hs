module Src.Common.Apps.Dunst (Dunst (..)) where

import           Src.Common.Utils.App (App (..))


data Dunst = Dunst

instance App Dunst where
    -- | Start notification-daemon
    appCommand _ = "dunst"
