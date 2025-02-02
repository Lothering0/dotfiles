module Src.Common.Apps.Telegram (Telegram (..)) where

import           Src.Common.Utils.App (App (..))


data Telegram = Telegram

instance App Telegram where
    appClassName _ = pure "TelegramDesktop"

    appCommand   _ = "telegram-desktop"
