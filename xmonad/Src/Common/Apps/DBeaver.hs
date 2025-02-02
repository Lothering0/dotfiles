module Src.Common.Apps.DBeaver (DBeaver (..)) where

import           Src.Common.Utils.App (App (..))


data DBeaver = DBeaver

instance App DBeaver where
    appClassName _ = pure "DBeaver"

    appCommand   _ = "dbeaver"
