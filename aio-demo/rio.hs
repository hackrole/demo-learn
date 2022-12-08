#!/usr/bin/env stack
-- stack --resolver lts-20.0 script
{-# LANGUAGE NoImplicitPrelude #-}
import Prelude (putStrLn)
import RIO

type Name = String

main :: IO ()
main = do
  let name = "Alice"
  runRIO name $ do
    sayHello
    sayGoodbye

sayHello :: RIO Name ()
sayHello = do
  name <- ask
  liftIO $ putStrLn $ "hello, " ++ name

sayGoodbye :: RIO Name ()
sayGoodbye = do
  name <- ask
  liftIO $ putStrLn $ "Goodbye, " ++ name
