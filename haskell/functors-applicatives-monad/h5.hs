#!/usr/bin/env stack
-- stack --resolver lts-20.0 --install-ghc runghc
import Text.Read (readMaybe)

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided an invalid year"
    Just age -> putStrLn $ "In 2020, you will be: " ++ show age

yearToAge year = 2020 -byear

main = do
  putStrLn "Please enter your birth year"
  yearString <- getLine
  let maybeAge = fmap yearToAge (readMaybe yearString)
  displayAge maybeAge
