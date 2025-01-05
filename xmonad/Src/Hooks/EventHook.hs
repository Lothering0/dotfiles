module Src.Hooks.EventHook where

import           Data.Semigroup        (All)

import           XMonad
import           XMonad.Hooks.Rescreen

import           Src.Common.Apps.Kitty (Kitty (..))
import           Src.Common.Utils.App  (App (..))


{-| * EwmhDesktops users should change this to ewmhDesktopsEventHook

Defines a custom handler function for X Events. The function should
return (All True) if the default handler is to be run afterwards. To
combine event hooks use mappend or mconcat from Data.Monoid. -}
myEventHook :: Event -> X All
myEventHook = mempty
