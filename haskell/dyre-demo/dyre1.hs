#!/usr/bin/env stack
-- stack --resolver lts-20.0 script --package dyre

module DyreExample
  (Config(..)
  , defaultConfig
  , dyreExample
  )
where

import qualified Config.Dyre as Dyre
import Config.Dyre.Relaunch

import System.IO

data Config = Config { message :: String, errorMsg :: Maybe String }
data State = State { bufferLines :: [String] } deriving (Read, Show)

defaultConfig :: Config
defaultConfig = Config "Dyre Example v0.1" Nothing

showError :: Config -> String -> Config
showError cfg msg = cfg {errorMsg = Just msg}

realMain Config{message = message, errorMsg = errorMsg} = do
  (State buffer) <- restoreTextState $ State []
  case errorMsg of
    Nothing -> return ()
    Just em -> putStrLn $ "Error: " ++ em
  putStrLn message
  traverse putStrLn . reverse $ buffer
  putStr "> " *> hFlush stdout
  input <- getLine
  case input of
    "exit" -> return ()
    "quit" -> return ()
    other -> relaunchWithTextState(State $ other:buffer) Nothing

dyreExample = Dyre.wrapMain $ Dyre.newParams "dyreExample" realMain showError

main = dyreExample defaultConfig
