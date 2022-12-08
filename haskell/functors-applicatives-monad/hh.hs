#!/usr/bin/env stack
-- stack --resolver lts-20.0 --install-ghc runghc

import Text.Read (readMaybe)

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided invalid input"
    Just age -> putStrLn $ "In that year, you will be: " ++ show age


yearDiff futureYear birthYear = futureYear - birthYear

main = do
  putStrLn "Please enter you birth year"
  birYearString <- getLine
  putStrLn "Please enter some year in the future"
  futureYearString <- getLine
  let maybeAge = do
        birthYear <- readMaybe birYearString
        futureYear <- readMaybe futureYearString
        return $ yearDiff futureYear birthYear
  displayAge maybeAge
