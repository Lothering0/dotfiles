{-# LANGUAGE LambdaCase #-}

module Src.Common.Utils.DockVisibility where

import           XMonad (Message)


data DockVisibility = DockHidden | DockActive  deriving (Show, Read, Eq)

instance Message DockVisibility

dockVisibility :: a -> a -> DockVisibility -> a
dockVisibility whenHidden whenActive = \case
    DockHidden -> whenHidden
    DockActive -> whenActive
