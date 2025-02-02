module Src.Config.StatusBar (myStatusBar) where

import           XMonad.Hooks.StatusBar
import           XMonad.Hooks.StatusBar.PP
import           XMonad.Util.ClickableWorkspaces (clickablePP)

import           Src.Common.Apps.Xmobar          (Xmobar (..))
import           Src.Common.Utils.App            (App (..))


myStatusBar :: StatusBarConfig
myStatusBar = statusBarProp (appRun Xmobar) (pure myPP)

-- | See: https://xmonad.github.io/xmonad-docs/xmonad-contrib/XMonad-Hooks-StatusBar-PP.html#t:PP
myPP :: PP
myPP = def
    { ppCurrent = \ workspaceId ->
           "<box type=Bottom width=2 color=#89ddff> <fc=#89ddff>"
        ++ workspaceId
        ++ "</fc> </box>"
    , ppHidden  = \ workspaceId -> " " ++ workspaceId ++ " "
    , ppUrgent  = \ workspaceId -> " " ++ workspaceId ++ " "
    , ppLayout  = const ""
    , ppTitle   = const ""
    -- , ppTitle   = formatTitle
    , ppSep     = "   "
    -- , ppSep     = " <fc=#464b5d>·</fc> "
    }

formatTitle :: String -> String
formatTitle ""    = ""
formatTitle title
    | length title > maxLength = formatTitle shortTitle
    | otherwise = "<fn=1>" ++ title ++ "</fn>"
  where
    shortTitle :: String
    shortTitle = take (maxLength - 3) title ++ "..."

    maxLength :: Int
    maxLength = 40
