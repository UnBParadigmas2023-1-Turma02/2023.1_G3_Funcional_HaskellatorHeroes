-- Módulo Tree
module Tree where

import Hero
import Hero (Hero(InvalidAnswer))

data Tree a = Leaf a | Node String (Tree a) (Tree a)
  deriving (Show)

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
              (Leaf (Right DrMeiaNoite))
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
    (Node "O herói é do gênero feminino?"
      (Node "O herói é da raça humana?"
        (Node "O herói é um assassino treinado?"
          (Leaf (Right ViuvaNegra))
          (Leaf (Right Vespa))
        )
        (Node "O herói é Um mutante?"
          (Node "O herói possui poderes sobre o clima?"
            (Leaf (Right Tempestade))
            (Node "O herói possui poderes telecinéticos?"
              (Leaf (Right JeanGrey))
              (Leaf (Right JessicaJones))
            )
          )
          (Leaf (Right Gamora))
        )
      )
      --Não
      (Node "O herói é da raça humana?"
        --Sim
        (Node "O herói é um bilionário com armadura tecnológica?"
          (Leaf (Right HomemDeFerro))
          (Node "O herói possui um escudo de Vibranium?"
            (Leaf (Right CapitaoAmerica))
            (Node "O herói é cego?"
              (Leaf (Right Demolidor))
              (Node "O herói tem habilidades com arco e flecha?"
                (Leaf (Right GaviaoArqueiro))
                (Node "O herói é ex-militar?"
                  (Leaf (Right Justiceiro))
                  (Leaf (Right Falcao))
                )
              )
            )
          )
        )
        --Nao
        (Node "O herói é um Deus ou semi-Deus?"
          (Node "O herói é um Deus Nórdico?"
            (Leaf (Right Thor))
            (Leaf (Right Hercules))
          )
          (Node "O herói é uma IA?"
            (Leaf (Right Visao))
            (Node "O herói é Um mutante?"
              (Leaf (Right Wolverine))
              (Node "O herói é Um Hibrido?"
                (Leaf (Right Blaide))
                (Node "O herói é Um Alienigina?"
                  (Leaf (Right Quasar))
                  (Node "O herói é Uma árvore?"
                    (Leaf (Right Groot))
                    (Leaf (Right RocketRaccoon))
                  )
                )
              )
            )
          )
        )
      )
    )

  -- responder folha do nao


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

parseTree :: String -> Tree (Either String Hero) -> Either Hero (Tree (Either String Hero))
parseTree _ (Leaf (Right hr)) = Left hr
parseTree ans (Node _ lftree rgtree) = case ans of
  "sim" -> Right lftree
  "não" -> Right rgtree
  _     -> Left InvalidAnswer

-- | Executa o jogo e retorna o herói escolhido pelo usuário
runGame :: Tree (Either String Hero) -> IO Hero
runGame (Leaf (Left message)) = do
  putStrLn message
  runGame tree
runGame (Leaf (Right hero)) = do
  -- | putStrLn ("O herói em que você está pensando é " ++ show hero ++ ".")
  return hero
runGame (Node question left right) = do
  putStrLn question
  answer <- getLine
  case answer of
    "sim" -> runGame left
    "não" -> runGame right
    _     -> return InvalidAnswer
