module Src.Common.Utils.Echo where

import           XMonad (X, spawn)


newtype EchoFilePath = EchoFilePath String
newtype EchoMessage  = EchoMessage  String

doEcho :: EchoFilePath -> EchoMessage -> X ()
doEcho (EchoFilePath path) (EchoMessage message) = spawn
    $  "echo \""
    ++ message
    ++ "\" >> "
    ++ path

doLog :: String -> X ()
doLog message = doEcho (EchoFilePath "~/dotfiles/xmonad/log.txt") (EchoMessage message)
