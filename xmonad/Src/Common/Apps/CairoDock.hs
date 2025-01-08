module Src.Common.Apps.CairoDock (CairoDock (..), CairoDockApp (..)) where

import           Src.Common.Utils.App         (App (..))
import           Src.Common.Utils.DockHandler (DockVisibility (..),
                                               dockVisibility)


class App a => CairoDockApp a where
    hideDock     :: a -> String

    activateDock :: a -> String
    {-# MINIMAL hideDock, activateDock #-}

pathToDir :: String
pathToDir = "~/dotfiles/cairo-dock"

pathToConfig :: String
pathToConfig = pathToDir ++ "/current_theme/cairo-dock.conf"

writeVisibilityToConfig :: Int -> String
writeVisibilityToConfig x =
       "sed -i -- 's/visibility=[0-9]/visibility="
    ++ level
    ++ "/g' "
    ++ pathToConfig
  where
    level :: String
    level = show x

getLevelByVisibility :: DockVisibility -> Int
getLevelByVisibility = dockVisibility levelWhenHidden levelWhenActive
  where
    levelWhenHidden :: Int
    levelWhenHidden = 5

    levelWhenActive :: Int
    levelWhenActive = 1

setVisibility :: DockVisibility -> String
setVisibility = writeVisibilityToConfig . getLevelByVisibility

data CairoDock = CairoDock

instance App CairoDock where
    appCommand = const "cairo-dock"

    -- | Launch dock
    appRun app = appCommand app ++ " -o -d " ++ pathToDir

instance CairoDockApp CairoDock where
    hideDock     = const . setVisibility $ DockHidden

    activateDock = const . setVisibility $ DockActive
