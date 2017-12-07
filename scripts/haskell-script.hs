#!/usr/bin/env stack
-- stack runghc --resolver lts-9.14 --install-ghc
{-# LANGUAGE CPP #-}

import           System.Environment (getArgs)

import           System.Directory   (doesFileExist)
import           System.Process     (readProcess)


main :: IO ()
main = getArgs >>= \(f:_) -> doesFileExist f >>= \exists ->
  case exists of
    False -> readFile __FILE__ >>= writeFile f >> chmodx f
    True  -> error "File exists"
  where
    chmodx f = readProcess "chmod" [ "+x" , f ] "" >> return ()
