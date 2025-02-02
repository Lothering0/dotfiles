module Src.Common.Apps.Discord (Discord (..)) where

import           Src.Common.Utils.App (App (..))


data Discord = Discord

instance App Discord where
    appClassName _ = pure "discord"

    appCommand   _ = "discord"
