module Src.Commands.Battery where

import           Control.Monad (join)

import           Xmobar


-- | See https://codeberg.org/xmobar/xmobar/src/branch/master/doc/plugins.org#headline-4
batteryCommand :: Runnable
batteryCommand = Run $
    BatteryP
    ["BAT1"]
    args
    refreshRate
  where
    args :: [String]
    args = join
        [ template
        , separator
        , whenCharging
        , whenOff
        , whenIdle
        , whenLow
        , whenMedium
        , whenHigh
        , usePercentage
        , lowThreshold
        , highThreshold
        , customThresholdAction
        , customThreshold
        ]

    template :: [String]
    template = ["-t", "<acstatus>"]

    separator :: [String]
    separator = ["--"]

    whenCharging :: [String]
    whenCharging =
        [ "-O"
        , battery BatteryIndicator { color = "#82aaff", icon = "\988171" }  -- \988171 = 󱐋
        ]

    whenOff :: [String]
    whenOff = ["-o", ""]

    whenIdle :: [String]
    whenIdle =
        [ "-i"
        , battery BatteryIndicator { color = "#82aaff", icon = "\988171" }  -- \988171 = 󱐋
        ]

    whenLow :: [String]
    whenLow =
        [ "--lows"
        , battery BatteryIndicator { color = "#dc6068", icon = "\62019" }  -- \62019 = 
        ]

    whenMedium :: [String]
    whenMedium =
        [ "--mediums"
        , battery BatteryIndicator { color = "#e6b455", icon = "\62018" }  -- \62018 = 
        ]

    whenHigh :: [String]
    whenHigh =
        [ "--highs"
        , battery BatteryIndicator { color = "#abcf76", icon = "\62016" }  -- \62016 = 
        ]

    -- | To include a percentage symbol in left
    usePercentage :: [String]
    usePercentage = ["-P"]

    lowThreshold :: [String]
    lowThreshold = ["-L", "20"]

    highThreshold :: [String]
    highThreshold = ["-H", "69"]

    customThresholdAction :: [String]
    customThresholdAction = ["-a", "notify-send -u critical -t 5000 'Low battery'"]

    customThreshold :: [String]
    customThreshold = ["-A", "15"]

    refreshRate :: Rate
    refreshRate = 600

data BatteryIndicator = BatteryIndicator { icon :: !String, color :: !String }

battery :: BatteryIndicator -> String
battery (BatteryIndicator { icon, color }) =
       "<box type=Bottom width=2 color="
    ++ color
    ++ "> <fc="
    ++ color
    ++ ">"
    ++ icon
    ++ " <left></fc> </box>"
