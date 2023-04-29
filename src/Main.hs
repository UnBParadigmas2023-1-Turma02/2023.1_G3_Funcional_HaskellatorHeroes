-- Módulo Main
module Main where

import Hero
import Tree

main :: IO ()
main = do
  putStrLn "Pense em um herói da Liga da Justiça e responda as perguntas abaixo:"
  hero <- runGame tree
  putStrLn ("O herói em que você está pensando é: " ++ show hero ++ ".")
