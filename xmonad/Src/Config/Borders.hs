module Src.Config.Borders where

import           GHC.Word                  (Word32)
import           Src.Common.Types.HexColor


-- | Width of the window border in pixels
myBorderWidth :: Word32
myBorderWidth = 1

-- | Border color for focused windows
myFocusedBorderColor = "#000000" :: HexColor

-- | Border color for unfocused windows
myNormalBorderColor  = "#000000" :: HexColor
