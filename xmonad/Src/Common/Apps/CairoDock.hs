module Src.Common.Apps.CairoDock (CairoDock (..), CairoDockApp (..)) where

import           Data.Array           (inRange)

import           Src.Common.Utils.App (App (..))


class App a => CairoDockApp a where
    hideDock     :: a -> String

    activateDock :: a -> String
    {-# MINIMAL hideDock, activateDock #-}

pathToDir :: String
pathToDir = "~/dotfiles/cairo-dock"

pathToConfig :: String
pathToConfig = pathToDir ++ "/current_theme/cairo-dock.conf"

writeVisibilityToConfig :: CairoDockVisibilityLevel -> String
writeVisibilityToConfig (CairoDockVisibilityLevel level) =
       "sed -i -- 's/visibility=[0-9]/visibility="
    ++ levelString
    ++ "/g' "
    ++ pathToConfig
  where
    levelString :: String
    levelString = show level

newtype CairoDockVisibilityLevel = CairoDockVisibilityLevel Int

mkCairoDockVisibilityLevel :: Int -> CairoDockVisibilityLevel
mkCairoDockVisibilityLevel x
    | inRange range x = CairoDockVisibilityLevel x
    | otherwise       = error errorMessage
  where
    minLevel :: Int
    minLevel = 0

    maxLevel :: Int
    maxLevel = 10

    range :: (Int, Int)
    range = (minLevel, maxLevel)

    errorMessage :: String
    errorMessage =
           "Invalid Cairo-Dock visibility level. Must be "
        ++ show minLevel
        ++ "-"
        ++ show maxLevel

levelWhenHidden ::  CairoDockVisibilityLevel
levelWhenHidden = mkCairoDockVisibilityLevel 5

levelWhenActive ::  CairoDockVisibilityLevel
levelWhenActive = mkCairoDockVisibilityLevel 1

data CairoDock = CairoDock

instance App CairoDock where
    appClassName _ = pure "Cairo-dock"

    appCommand   _ = "cairo-dock"

    -- | Launch dock
    appRun app     = appCommand app ++ " -o -d " ++ pathToDir

instance CairoDockApp CairoDock where
    hideDock     _ = writeVisibilityToConfig levelWhenHidden

    activateDock _ = writeVisibilityToConfig levelWhenActive
