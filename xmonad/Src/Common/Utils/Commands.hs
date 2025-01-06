module Src.Common.Utils.Commands where

import           Data.List (intercalate)


runCommands :: [String] -> String
runCommands = intercalate "; "

safeRunCommands :: [String] -> String
safeRunCommands = intercalate " && "

pipeCommands :: [String] -> String
pipeCommands = intercalate " | "
