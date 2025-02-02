module Src.Common.Apps.Obsidian (Obsidian (..)) where

import           Src.Common.Utils.App (App (..))


data Obsidian = Obsidian

instance App Obsidian where
    appClassName _ = pure "obsidian"

    appCommand   _ = "obsidian"
