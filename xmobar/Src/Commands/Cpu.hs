module Src.Commands.Cpu where

import           Xmobar


-- | See https://codeberg.org/xmobar/xmobar/src/branch/master/doc/plugins.org#headline-8
cpuCommand :: Runnable
cpuCommand = Run $ Cpu template refreshRate
  where
    template :: [String]
    template =
        [ "-t"
        , "<box type=Bottom width=2 color=#89ddff> <fc=#89ddff>\62652 <total>%</fc> </box>"  -- \62652 = 
        ]

    refreshRate :: Rate
    refreshRate = 10
