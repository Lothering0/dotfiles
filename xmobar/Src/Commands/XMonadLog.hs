module Src.Commands.XMonadLog where

import           Xmobar


-- | See https://xmonad.github.io/xmonad-docs/xmonad-contrib/XMonad-Hooks-StatusBar.html
xmonadLogCommand :: Runnable
xmonadLogCommand = Run XMonadLog
-- xmonadLogCommand = Run UnsafeXMonadLog
