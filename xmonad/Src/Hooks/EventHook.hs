module Src.Hooks.EventHook where

import           Data.Semigroup (All)

import           XMonad


{-| Defines a custom handler function for X Events. The function should
return (All True) if the default handler is to be run afterwards. To
combine event hooks use mappend or mconcat from Data.Monoid. -}
myEventHook :: Event -> X All
myEventHook = mempty
