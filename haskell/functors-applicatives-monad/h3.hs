#!/usr/bin/env stack
-- stack --resolver lts-20.0 --install-ghc runghc
import Text.Read (readMaybe)

main = do
  putStrLn "Please enter you birth year"
  yearString <- getLine
  case readMaybe yearString of
    Nothing -> putStrLn "Your provided an invalid year"
    Just year -> putStrLn $ "In 2020, your will be: " ++ show year
