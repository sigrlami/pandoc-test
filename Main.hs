module Main where

import Text.Pandoc
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
  result <- runIO $ do
    doc <- readMarkdown def (T.pack "[testing](url)")
    writeHtml5String def doc
  m <- handleError result
  TIO.putStrLn m
