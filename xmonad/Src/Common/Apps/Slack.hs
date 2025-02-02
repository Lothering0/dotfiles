module Src.Common.Apps.Slack (Slack (..)) where

import           Src.Common.Utils.App (App (..))


data Slack = Slack

instance App Slack where
    appClassName _ = pure "Slack"

    appCommand   _ = "slack"
