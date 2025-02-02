module Src.Commands.Date where

import           Xmobar


-- | See https://codeberg.org/xmobar/xmobar/src/branch/master/doc/plugins.org#headline-17
dateCommand :: Runnable
dateCommand = Run $ Date format alias refreshRate
  where
    format :: String
    format = "%a %b %_d, %_I:%M %p"

    alias :: String
    alias = "date"

    refreshRate :: Rate
    refreshRate = 10
