module Src.Hooks.StartupHook where

import           XMonad
import           XMonad.Util.SpawnOnce

import           Src.Common.Apps.Amixer           (Amixer (..))
import           Src.Common.Apps.Dunst            (Dunst (..))
import           Src.Common.Apps.Flameshot        (Flameshot (..))
import           Src.Common.Apps.Nitrogen         (Nitrogen (..))
import           Src.Common.Apps.Picom            (Picom (..))
import           Src.Common.Apps.RogControlCenter (RogControlCenter (..))
import           Src.Common.Apps.Xset             (Xset (..))

import           Src.Common.Utils.App             (App (appInit))


{-| Perform an arbitrary action each time xmonad starts or is restarted
with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
per-workspace layout choices.

By default, do nothing. -}
myStartupHook :: X ()
myStartupHook = mapM_ spawnOnce initCommands

initCommands :: [String]
initCommands =
  [ appInit Dunst
  , appInit Amixer
  , appInit Xset
  , appInit Nitrogen
  , appInit Picom
  , appInit Flameshot
  , appInit RogControlCenter
  ]
