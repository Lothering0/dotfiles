import           Xmobar

import           Src.Commands.Battery   (batteryCommand)
import           Src.Commands.Cpu       (cpuCommand)
import           Src.Commands.Date      (dateCommand)
import           Src.Commands.Memory    (memoryCommand)
import           Src.Commands.Swap      (swapCommand)
import           Src.Commands.XMonadLog (xmonadLogCommand)


-- | See: https://codeberg.org/xmobar/xmobar/src/branch/master/doc/quick-start.org
--   See: https://codeberg.org/xmobar/xmobar/src/branch/master/doc/using-haskell.org
config :: Config
config = defaultConfig
    { font            = "Cascadia Mono 13"
    , additionalFonts = ["Cascadia Mono 11"]
    , bgColor         = "#0f111a"
    , fgColor         = "#a6accd"
    , position        = TopHM
        40  -- ^ height
        26  -- ^ left
        26  -- ^ right
        8   -- ^ top
        0   -- ^ bottom
    , lowerOnStart    = True
    , commands        =
        [ xmonadLogCommand
        , cpuCommand
        , memoryCommand
        , swapCommand
        , batteryCommand
        , dateCommand
        ]
    , sepChar         = "%"
    , alignSep        = "}{"
    , template        = "  " ++ haskellIcon ++ "  %XMonadLog% }{ %cpu%  %memory% %swap%   %battery% %date%  "
    }
  where
    haskellIcon :: String
    haskellIcon = "<fc=#b480d6>\986258</fc>"  -- \986258 = 󰲒

main :: IO ()
main = xmobar config
