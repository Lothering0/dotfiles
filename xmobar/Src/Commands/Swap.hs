module Src.Commands.Swap where

import           Xmobar


-- | See https://codeberg.org/xmobar/xmobar/src/branch/master/doc/plugins.org#headline-8
swapCommand :: Runnable
swapCommand = Run $ Swap template refreshRate
  where
    template :: [String]
    template = ["-t", "<fc=#464b5d>\986061 <used> MB</fc>"]  -- \986061 = 󰯍

    refreshRate :: Rate
    refreshRate = 10
