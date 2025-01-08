import           XMonad
import           XMonad.Actions.SpawnOn   (manageSpawn)
import           XMonad.Hooks.ManageDocks
import           XMonad.Util.Run

import           Src.Common.Apps.Xmobar   (Xmobar (..))
import           Src.Common.Utils.App     (App (..))

import           Src.Config.Borders       (myBorderWidth, myFocusedBorderColor,
                                           myNormalBorderColor)
import           Src.Config.Focus         (myClickJustFocuses,
                                           myFocusFollowsMouse)
import           Src.Config.KeyBindings   (myKeys, myModMask)
import           Src.Config.MouseBindings (myMouseBindings)
import           Src.Config.Terminal      (myTerminal)
import           Src.Config.Workspaces    (myWorkspaces)

import           Src.Hooks.EventHook      (myEventHook)
import           Src.Hooks.LayoutHook     (myLayoutHook)
import           Src.Hooks.LogHook        (myLogHook)
import           Src.Hooks.ManageHook     (myManageHook)
import           Src.Hooks.StartupHook    (myStartupHook)


-- | Run xmonad with the settings you specify. No need to modify this.
main = do
    xmproc <- spawnPipe . appRun $ Xmobar
    xmonad . docks $ defaults

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
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor

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
