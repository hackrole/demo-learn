#!/usr/bin/env stack
-- stack --resolver lts-20.0 script --package rio
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

import RIO

main :: IO ()
main = runSimpleApp $ logInfo "Hello world!"
