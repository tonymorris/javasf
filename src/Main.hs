module Main where

import Data.List(null)
import Data.Foldable(mapM_)
import Language.Java.Javasf(javasf)
import System.Environment(getArgs)
import System.IO(IO, putStrLn)

main ::
  IO ()
main =
  do a <- getArgs
     if null a
        then mapM_ putStrLn
                     [
                       "<javasf> Copyright 2009-2014 Tony Morris"
                     , "This software is made available under a BSD3 open source license"
                     , []
                     , "Prints the SourceFile attribute of one or more Java class files."
                     , []
                     , "javasf FILE1 [FILE2...]"
                     ]
        else javasf a
