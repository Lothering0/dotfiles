module Src.Common.Apps.Postman (Postman (..)) where

import           Src.Common.Utils.App (App (..))


data Postman = Postman

instance App Postman where
    appClassName _ = pure "Postman"

    appCommand   _ = "postman"
