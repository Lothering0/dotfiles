import           XMonad
import           XMonad.Actions.SpawnOn    (manageSpawn)
import           XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.StatusBar    (withSB)

import           Src.Config.Borders        (myBorderWidth, myFocusedBorderColor,
                                            myNormalBorderColor)
import           Src.Config.Focus          (myClickJustFocuses,
                                            myFocusFollowsMouse)
import           Src.Config.KeyBindings    (myKeys, myModMask)
import           Src.Config.MouseBindings  (myMouseBindings)
import           Src.Config.StatusBar      (myStatusBar)
import           Src.Config.Terminal       (myTerminal)
import           Src.Config.Workspaces     (myWorkspaces)

import           Src.Hooks.EventHook       (myEventHook)
import           Src.Hooks.LayoutHook      (myLayoutHook)
import           Src.Hooks.LogHook         (myLogHook)
import           Src.Hooks.ManageHook      (myManageHook)
import           Src.Hooks.StartupHook     (myStartupHook)


-- | Run xmonad with the settings you specify. No need to modify this.
main = xmonad . statusBarSupport . ewmhSupport . docks $ defaults
  where
    ewmhSupport :: XConfig a -> XConfig a
    ewmhSupport = ewmhFullscreen . ewmh

    statusBarSupport :: LayoutClass l Window => XConfig l -> XConfig l
    statusBarSupport = withSB myStatusBar

{-| A structure containing your configuration settings, overriding
fields in the default config. Any you don't override, will
use the defaults defined in xmonad/XMonad/Config.hs

No need to modify this. -}
defaults = def
    -- simple stuff
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , clickJustFocuses   = myClickJustFocuses
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , modMask            = myModMask
    , workspaces         = myWorkspaces

    -- key bindings
    , keys               = myKeys
    , mouseBindings      = myMouseBindings

    -- hooks, layouts
    , layoutHook         = myLayoutHook
    , manageHook         = manageSpawn <> myManageHook
    , handleEventHook    = myEventHook
    , logHook            = myLogHook
    , startupHook        = myStartupHook
    }
