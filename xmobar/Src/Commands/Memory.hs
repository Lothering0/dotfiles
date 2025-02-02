module Src.Commands.Memory where

import           Xmobar


-- | See https://codeberg.org/xmobar/xmobar/src/branch/master/doc/plugins.org#headline-8
memoryCommand :: Runnable
memoryCommand = Run $ Memory template refreshRate
  where
    template :: [String]
    template =
        [ "-t"
        , "<box type=Bottom width=2 color=#82aaff> <fc=#82aaff>\61381 <used> MB (<usedratio>%)</fc> </box>"  -- \61381 = 
        ]

    refreshRate :: Rate
    refreshRate = 10
