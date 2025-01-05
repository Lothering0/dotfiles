module Src.Common.Utils.Xmonad where

import           XMonad          (Window, X, description, gets, windowset)
import           XMonad.StackSet (StackSet (current), allWindows, index, layout,
                                  workspace)


getLayoutDescription :: X String
getLayoutDescription = do
    winset <- gets windowset
    pure . description . layout . workspace . current $ winset

getAllWindows :: X [Window]
getAllWindows = do
    winset <- gets windowset
    pure . allWindows $ winset

getLayoutWindows :: X [Window]
getLayoutWindows = gets $ index . windowset
