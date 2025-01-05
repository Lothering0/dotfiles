module Src.Common.Utils.Intercalate where

import           Data.List (intercalate)


intercalateTuple2 :: [a] -> ([a], [a]) -> [a]
intercalateTuple2 xs (x, y) = intercalate xs [x, y]
