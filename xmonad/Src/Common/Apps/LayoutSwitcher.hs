module Src.Common.Apps.LayoutSwitcher (LayoutSwitcher (..)) where

import           Src.Common.Utils.App (App (..))


data LayoutSwitcher = LayoutSwitcher

instance App LayoutSwitcher where
    appCommand = const "~/dotfiles/xmonad/layout_switch.sh"
