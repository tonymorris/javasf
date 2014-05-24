module Language.Java.Javasf where

import Prelude(FilePath)
import Data.Binary.Get
import qualified Data.ByteString.Lazy as B
import Data.Maybe
import Data.String(String)
import Control.Monad((<=<))
import Data.Foldable(mapM_)
import Data.Function((.))
import Data.Tuple(snd)
import Language.Java.ClassFile
import System.IO(IO, putStrLn)

sourceFile ::
  B.ByteString
  -> Maybe String
sourceFile =
  sourcePath . snd . runGet getClass

showSourceFile ::
  B.ByteString
  -> String
showSourceFile x =
  "?Unknown?" `fromMaybe` sourceFile x

javasf ::
  [FilePath]
  -> IO ()
javasf =
  mapM_ ((putStrLn . showSourceFile) <=< B.readFile)
