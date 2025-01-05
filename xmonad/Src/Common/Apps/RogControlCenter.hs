module Src.Common.Apps.RogControlCenter (RogControlCenter (..)) where

import           Src.Common.Utils.App (App (..))


data RogControlCenter = RogControlCenter

instance App RogControlCenter where
    -- Start Rog Control Center for automatically switching between dGPU and iGPU
    appCommand = const "rog-control-center"
