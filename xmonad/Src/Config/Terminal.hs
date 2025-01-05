module Src.Config.Terminal where

import           Src.Common.Apps.Kitty (Kitty (..))

import           Src.Common.Utils.App  (App (..))


{-| The preferred terminal program, which is used in a binding below and by
certain contrib modules. -}
myTerminal :: String
myTerminal = appRun Kitty
