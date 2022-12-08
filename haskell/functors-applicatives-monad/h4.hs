#!/usr/bin/env stack
-- stack --resolver lts-20.0 --install-ghc runghc
import Text.Read (readMaybe)

displayAge :: Maybe Int -> IO ()
displayAge maybeAge = 
  case maybeAge of
    Nothing -> putStrLn "You provided an invalid year"
    Just age -> putStrLn $ "In 2020, you will be:" ++ show age

yearToAge year = 2020 - year

main = do
  putStrLn "please enter your birth year"
  yearString <- getLine
  let maybeAge =
        case readMaybe yearString of
          Nothing -> Nothing
          Just year -> Just (yearToAge year)
  displayAge maybeAge

