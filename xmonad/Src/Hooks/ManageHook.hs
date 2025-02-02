module Src.Hooks.ManageHook where

import           Data.Maybe               (catMaybes)

import           XMonad

import           Src.Common.Apps.DBeaver  (DBeaver (..))
import           Src.Common.Apps.Discord  (Discord (..))
import           Src.Common.Apps.Obsidian (Obsidian (..))
import           Src.Common.Apps.Postman  (Postman (..))
import           Src.Common.Apps.Slack    (Slack (..))
import           Src.Common.Apps.Telegram (Telegram (..))

import           Src.Common.Utils.App     (App (appClassName))


{- Execute arbitrary actions and WindowSet manipulations when managing
a new window. You can use this to, for example, always float a
particular program, or have a client always appear on a particular
workspace.

To find the property name associated with a program, use
> xprop | grep WM_CLASS
and click on the client you're interested in.

To match on the WM_NAME, you can use 'title' in the same way that
'className' and 'resource' are used below. -}
myManageHook = composeAll
    [ isSomeOf messengers className --> doShift "2"
    , isSomeOf tools      className --> doShift "3"
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    ]
  where
    messengers :: [String]
    messengers = catMaybes
        [appClassName Slack, appClassName Telegram, appClassName Discord]

    tools :: [String]
    tools = catMaybes [appClassName Obsidian, appClassName Postman, appClassName DBeaver]

isSomeOf :: [String] -> Query String -> Query Bool
isSomeOf []     _ = pure False
isSomeOf (x:xs) y = y =? x <||> isSomeOf xs y
