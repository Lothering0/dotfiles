module Src.Config.Borders where

import           GHC.Word                  (Word32)
import           Src.Common.Types.HexColor


-- | Width of the window border in pixels
myBorderWidth :: Word32
myBorderWidth = 1

-- | Border color for focused windows
myFocusedBorderColor :: HexColor
myFocusedBorderColor = "#000000"

-- | Border color for unfocused windows
myNormalBorderColor  :: HexColor
myNormalBorderColor  = "#000000"
