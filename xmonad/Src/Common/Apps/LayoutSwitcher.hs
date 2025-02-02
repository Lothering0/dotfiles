module Src.Common.Apps.LayoutSwitcher (LayoutSwitcher (..)) where

import           Src.Common.Utils.App (App (..))


data LayoutSwitcher = LayoutSwitcher

instance App LayoutSwitcher where
    appCommand _ = "~/dotfiles/xmonad/layout_switch.sh"
