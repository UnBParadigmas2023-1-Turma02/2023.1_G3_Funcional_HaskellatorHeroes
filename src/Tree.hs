-- Módulo Tree
module Tree where

import Hero

data Tree a = Leaf a | Node String (Tree a) (Tree a)
  deriving (Show)

data State = State { choice :: Maybe Bool, question :: String, finished :: Bool }

-- | Constrói a árvore com as perguntas e heróis
tree :: Tree (Either String Hero)
tree =
  Node "O herói que você está pensando é da DC?"
    (Node "O herói é do gênero feminino?"
      (Node "O herói é da raça humana?"
        (Node "O herói é filha do comissário de Gotham?"
          (Leaf (Right Batgirl))
          (Leaf (Right CanarioNegro))
        )
        (Node "O herói é um Deus ou semi-Deus?"
          (Leaf (Right MulherMaravilha))
          (Leaf (Right Zattana))
        )
      )
      (Node "O herói é um Deus, semi-Deus ou extraterrestre?"
        (Node "O herói é de Krypton?"
          (Leaf (Right Superman))
          (Leaf (Right CacadorDeMarte))
        )
        (Node "O herói é uma IA?"
          (Leaf (Right Ciborgue))
          (Node "O herói é um mutante?"
            (Node "O herói usa um anel de poder?"
              (Leaf (Right LanternaVerde))
              (Node "O herói possui super velocidade?"
                (Leaf (Right Flash))
                (Node "O herói usa habilidades elétricas?"
                  (Leaf (Right SuperChoque))
                  (Node "O herói tem poderes telepáticos?"
                    (Leaf (Right DrDestino))
                    (Node "O herói possui habilidades nucleares?"
                      (Leaf (Right Nuclear))
                      (Leaf (Right HomemElastico))
                    )
                  )
                )
              )
            )
            -- continuar a arvore aqui
            (Node "O herói é um lutador cego?"
              (Leaf (Right Demolidor))
              (Node "O herói é um arqueiro?"
                (Leaf (Right ArqueiroVerde))
                (Node "O herói é um mestre em combate corpo a corpo?"
                  (Leaf (Right Batman))
                  (Leaf (Right Pacificador))
                )
              )
            )
          )
        )
      )
    )
  (Leaf (Left "Desculpe, não consegui identificar o herói que você está pensando"))


    -- Exemplo de código
   {--(Node "O herói que você está pensando é humano?" 
      (Node  "O herói que você está pensando usa armas?" 
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
          (Leaf (Left "Desculpe, não consegui identificar o herói que você está pensando.")))))   -}

-- | Executa o jogo e retorna o herói escolhido pelo usuário
runGame :: Tree (Either String Hero ) -> Maybe String -> IO Hero
runGame (Leaf (Left message)) answer = do
  putStrLn message
  runGame tree ""
runGame (Leaf (Right hero)) answer = do
  -- | putStrLn ("O herói em que você está pensando é " ++ show hero ++ ".")
  return hero ""
runGame (Node question left right) answer = do
  escreveArquivo question
  setQuestion State { choice = Nothing, question = question, finished = False }
  answer <- pegaRespostaSeTiver3char
  if answer == "sim"
    then runGame left ""
    else runGame right ""

pegaRespostaSeTiver3char 
  - abre arquivo e ve se tem 3 char
  - se nao tiver chama pegaRespostaSeTiver3char depois de 1 segundo
  - se tiver escreve a pergunta
