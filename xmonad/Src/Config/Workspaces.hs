module Src.Config.Workspaces where

import           XMonad (WorkspaceId)


{-| The default number of workspaces (virtual screens) and their names.
By default we use numeric strings, but any string may be used as a
workspace name. The number of workspaces is determined by the length
of this list.

A tagging example:

> workspaces = ["web", "irc", "code" ] ++ map show [4..9] -}
myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1..9]
