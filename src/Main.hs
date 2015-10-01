{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment (getArgs)
import Data.Text as T (lines,splitOn,unlines,intercalate,unpack)
import Data.Text.IO as T (readFile,putStrLn)
import Text.Regex (mkRegex,matchRegex)

main ∷ IO ()
main = do
  (file:regx)    ← getArgs
  matrix         ← map (T.splitOn ",") <$> T.lines <$> T.readFile file
  let regex      = map (mkRegex) regx
  let match r t  = maybe False (\_ → True) (matchRegex r $ T.unpack t)
  let matchLines = filter (and . (zipWith match regex)) matrix
  let result     =  T.unlines $ map (T.intercalate ",") matchLines
  T.putStrLn result
