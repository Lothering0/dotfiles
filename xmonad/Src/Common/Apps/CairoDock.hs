module Src.Common.Apps.CairoDock (CairoDock (..)) where

import           Src.Common.Utils.App (App (..))


data CairoDock = CairoDock

instance App CairoDock where
    appCommand = const "cairo-dock"

    -- | Launch dock
    appRun app = appCommand app ++ " -o -d ~/dotfiles/cairo-dock"
