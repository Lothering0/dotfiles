module Src.Config.KeyBindings where

import           System.Exit

import           XMonad
import           XMonad.Actions.WithAll

import           Src.Common.Apps.Flameshot      (Flameshot (..))
import           Src.Common.Apps.LayoutSwitcher (LayoutSwitcher (..))
import           Src.Common.Apps.Rofi           (Rofi (..))
import           Src.Common.Apps.Xmonad         (Xmonad (..), XmonadApp (..))

import           Src.Common.Utils.App           (App (..))

import qualified Data.Map                       as M
import qualified XMonad.StackSet                as W


{-| modMask lets you specify which modkey you want to use. The default
is mod1Mask ("left alt").  You may also consider using mod3Mask
("right alt"), which does not conflict with emacs keybindings. The
"windows key" is usually mod4Mask. -}
myModMask :: KeyMask
myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modm}) =
    M.fromList $ mainKeyBindings ++ switchWorkspaceKeyBindings ++ switchScreenKeyBindings
  where
    mainKeyBindings =
        -- launch a terminal
        [ ((modm .|. shiftMask, xK_Return), spawn . XMonad.terminal $ conf      )
        , ((modm,               xK_t     ), spawn . XMonad.terminal $ conf      )

        -- launch rofi
        , ((modm,               xK_p     ), spawn . appRun $ Rofi               )

        -- close focused window
        , ((modm .|. shiftMask, xK_c     ), kill                                )

         -- Rotate through the available layout algorithms
        , ((modm,               xK_Escape), sendMessage NextLayout              )

        --  Reset the layouts on the current workspace to default
        , ((modm .|. shiftMask, xK_Escape), setLayout . XMonad.layoutHook $ conf)

        -- Resize viewed windows to the correct size
        , ((modm,               xK_n     ), refresh                             )

        -- Move focus to the next window
        , ((modm,               xK_Tab   ), windows W.focusDown                 )

        -- Move focus to the next window
        , ((modm,               xK_j     ), windows W.focusDown                 )

        -- Move focus to the previous window
        , ((modm,               xK_k     ), windows W.focusUp                   )

        -- Move focus to the master window
        , ((modm,               xK_m     ), windows W.focusMaster               )

        -- Swap the focused window and the master window
        , ((modm,               xK_Return), windows W.swapMaster                )

        -- Swap the focused window with the next window
        , ((modm .|. shiftMask, xK_j     ), windows W.swapDown                  )

        -- Swap the focused window with the previous window
        , ((modm .|. shiftMask, xK_k     ), windows W.swapUp                    )

        -- Turns floating window to normal
        , ((modm .|. shiftMask, xK_f     ), sinkAll                             )

        -- Shrink the master area
        , ((modm,               xK_h     ), sendMessage Shrink                  )

        -- Expand the master area
        , ((modm,               xK_l     ), sendMessage Expand                  )

        -- Push window back into tiling
        -- , ((modm,               xK_t     ), withFocused $ windows . W.sink)

        -- Increment the number of windows in the master area
        , ((modm              , xK_comma ), sendMessage (IncMasterN 1)          )

        -- Deincrement the number of windows in the master area
        , ((modm              , xK_period), sendMessage (IncMasterN (-1))       )

        -- Toggle the status bar gap
        -- Use this binding with avoidStruts from Hooks.ManageDocks.
        -- See also the statusBar function from Hooks.DynamicLog.
        --
        -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

        -- Quit xmonad
        , ((modm .|. shiftMask, xK_q     ), io exitSuccess                      )

        -- Restart xmonad
        , ((modm              , xK_q     ), spawn . recompileAndRestart $ Xmonad)

        , ((modm .|. shiftMask, xK_slash ), spawn . echoHelp $ Xmonad           )

        -- Change keyboard layout
        , ((modm              , xK_space ), spawn . appRun $ LayoutSwitcher     )

        -- Take a screenshot
        , ((modm              , xK_Print ), spawn . appRun $ Flameshot          )
        ]

    {-| mod-[1..9], Switch to workspace N
    mod-shift-[1..9], Move client to workspace N -}
    switchWorkspaceKeyBindings =
        [((m .|. modm, k), windows . f $ i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    {-| mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    mod-shift-{w,e,r}, Move client to screen 1, 2, or 3 -}
    switchScreenKeyBindings =
        [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
            | (key, sc) <- zip [xK_quotedbl, xK_comma, xK_period] [0..]
            , (f, m)    <- [(W.view, 0), (W.shift, shiftMask)]]
