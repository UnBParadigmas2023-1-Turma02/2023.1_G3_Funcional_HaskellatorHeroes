-- Módulo Tree
module Tree where

import Hero

data Tree a = Leaf a | Node String (Tree a) (Tree a)
  deriving (Show)

-- | Constrói a árvore com as perguntas e heróis
tree :: Tree (Either String Hero)
tree = 
    -- Exemplo de árvore de decisão APENAS UM EXEMPLO
    Node "O herói que você está pensando consegue voar?" 
    (Node "O herói que você está pensando é um alienígena?" 
      (Leaf (Right Superman))
      (Node "O herói que você está pensando tem um laço mágico?" 
        (Leaf (Right MulherMaravilha))
        (Leaf (Right MulherGaviao))))
    (Node "O herói que você está pensando é humano?" 
      (Node "O herói que você está pensando usa armas?" 
        (Leaf (Right Batman))
        (Node "O herói que você está pensando é ciborgue?" 
          (Leaf (Right Cyborg))
          (Leaf (Right CanarioNegro))))
      (Node "O herói que você está pensando tem habilidades sobre-humanas?" 
        (Node "O herói que você está pensando é extremamente rápido?" 
          (Leaf (Right Flash))
          (Node "O herói que você está pensando é um marciano?" 
            (Leaf (Right CacadorDeMarte))
            (Leaf (Right LanternaVerde))))
        (Node "O herói que você está pensando é um atlante?" 
          (Leaf (Right Aquaman))
          (Leaf (Left "Desculpe, não consegui identificar o herói que você está pensando.")))))

-- | Executa o jogo e retorna o herói escolhido pelo usuário
runGame :: Tree (Either String Hero) -> IO Hero
runGame (Leaf (Left message)) = do
  putStrLn message
  runGame tree
runGame (Leaf (Right hero)) = do
  putStrLn ("O herói em que você está pensando é " ++ show hero ++ ".")
  return hero
runGame (Node question left right) = do
  putStrLn question
  answer <- getLine
  if answer == "sim"
    then runGame left
    else runGame right

