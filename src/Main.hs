-- Módulo Main
module Main where

import Hero
import Tree

main :: IO ()
main = do
  putStrLn "Pense em um herói da Marvel ou DC e responda as perguntas abaixo:"
  hero <- runGame tree
  case hero of
    InvalidAnswer -> putStrLn "A sua resposta foi inválida, por favor, responda com 'sim' ou 'não'"
    _             -> putStrLn ("O herói em que você está pensando é: " ++ show hero ++ ".")
