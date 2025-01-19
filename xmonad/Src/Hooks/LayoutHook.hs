module Src.Hooks.LayoutHook where

import           XMonad
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.LayoutModifier    (ModifiedLayout)
import           XMonad.Layout.Spacing

import           Src.Common.Apps.CairoDock       (CairoDock (..),
                                                  CairoDockApp (..))
import           Src.Common.Utils.App            (App (..))
import           Src.Common.Utils.Commands       (runCommands)

import           Src.LayoutModifiers.DockHandler (Dock, DockHandlers (..),
                                                  useDock)


{-| You can specify and transform your layouts by modifying these values.
If you change layout bindings be sure to use 'mod-shift-space' after
restarting (with 'mod-q') to reset your layout state to the new
defaults, as xmonad preserves your old layout settings by default.

The available layouts.  Note that each layout is separated by |||,
which denotes layout choice. -}
myLayoutHook = spacingWithEdge 8 . myDock . avoidStruts $ layouts
  where
    layouts = Full ||| tiled ||| Mirror tiled

    -- | Default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio

    -- | The default number of windows in the master pane
    nmaster = 1

    -- | Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- | Percent of screen to increment by when resizing panes
    delta   = 3/100

myDock :: LayoutClass l a => l a -> ModifiedLayout Dock l a
myDock = useDock handlers
  where
    handlers :: DockHandlers
    handlers = DockHandlers
        { onHide   = spawn . runCommands $ [hideDock CairoDock, appRestart CairoDock]
        , onActive = spawn . runCommands $ [activateDock CairoDock, appRestart CairoDock]
        }
