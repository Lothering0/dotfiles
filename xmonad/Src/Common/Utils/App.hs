module Src.Common.Utils.App (App (..)) where


class App a where
    appCommand  :: a -> String

    appInit     :: a -> String
    appInit     = appRun

    appRun      :: a -> String
    appRun      = appCommand

    appKill     :: a -> String
    appKill app = "killall " ++ appCommand app

    appRestart     :: a -> String
    appRestart app = appKill app ++ "; " ++ appRun app
    {-# MINIMAL appCommand #-}
