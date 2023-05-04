-- Modulo Tree
module Tree where

import Hero
import Hero (Hero(InvalidAnswer))

data Tree a = Leaf a | Node String (Tree a) (Tree a)
  deriving (Show)

firstQuestion :: String
firstQuestion = "O heroi que voce esta pensando e da DC?"

-- | Constroi a arvore com as perguntas e herois
tree :: Tree (Either String Hero)
tree =
  Node "O heroi que voce esta pensando e da DC?"
    (Node "O heroi e do genero feminino?"
      (Node "O heroi e da raca humana?"
        (Node "O heroi e filha do comissario de Gotham?"
          (Leaf (Right Batgirl))
          (Leaf (Right CanarioNegro))
        )
        (Node "O heroi e um Deus ou semi-Deus?"
          (Leaf (Right MulherMaravilha))
          (Leaf (Right Zattana))
        )
      )
      (Node "O heroi e um Deus, semi-Deus ou extraterrestre?"
        (Node "O heroi e de Krypton?"
          (Leaf (Right Superman))
          (Leaf (Right CacadorDeMarte))
        )
        (Node "O heroi e uma IA?"
          (Leaf (Right Ciborgue))
          (Node "O heroi e um mutante?"
            (Node "O heroi usa um anel de poder?"
              (Leaf (Right LanternaVerde))
              (Node "O heroi possui super velocidade?"
                (Leaf (Right Flash))
                (Node "O heroi usa habilidades eletricas?"
                  (Leaf (Right SuperChoque))
                  (Node "O heroi possui capacete dourado?"
                    (Leaf (Right SrDestino))
                    (Node "O heroi possui habilidades nucleares?"
                      (Leaf (Right Nuclear))
                      (Leaf (Right HomemElastico))
                    )
                  )
                )
              )
            )
            -- continuar a arvore aqui
            (Node "O heroi e um lutador cego?"
              (Leaf (Right DrMeiaNoite))
              (Node "O heroi e um arqueiro?"
                (Leaf (Right ArqueiroVerde))
                (Node "O heroi e um mestre em combate corpo a corpo?"
                  (Leaf (Right Batman))
                  (Leaf (Right Pacificador))
                )
              )
            )
          )
        )
      )
    )
    (Node "O heroi e do genero feminino?"
      (Node "O heroi e da raca humana?"
        (Node "O heroi e um assassino treinado?"
          (Leaf (Right ViuvaNegra))
          (Leaf (Right Vespa))
        )
        (Node "O heroi e Um mutante?"
          (Node "O heroi possui poderes sobre o clima?"
            (Leaf (Right Tempestade))
            (Node "O heroi possui poderes telecineticos?"
              (Leaf (Right JeanGrey))
              (Leaf (Right JessicaJones))
            )
          )
          (Leaf (Right Gamora))
        )
      )
      --Nao
      (Node "O heroi e da raca humana?"
        --Sim
        (Node "O heroi e um bilionario com armadura tecnologica?"
          (Leaf (Right HomemDeFerro))
          (Node "O heroi possui um escudo de Vibranium?"
            (Leaf (Right CapitaoAmerica))
            (Node "O heroi e cego?"
              (Leaf (Right Demolidor))
              (Node "O heroi tem habilidades com arco e flecha?"
                (Leaf (Right GaviaoArqueiro))
                (Node "O heroi e ex-militar?"
                  (Leaf (Right Justiceiro))
                  (Leaf (Right Falcao))
                )
              )
            )
          )
        )
        --Nao
        (Node "O heroi e um Deus ou semi-Deus?"
          (Node "O heroi e um Deus Nordico?"
            (Leaf (Right Thor))
            (Leaf (Right Hercules))
          )
          (Node "O heroi e uma IA?"
            (Leaf (Right Visao))
            (Node "O heroi e Um mutante?"
              (Leaf (Right Wolverine))
              (Node "O heroi e Um Hibrido?"
                (Leaf (Right Blade))
                (Node "O heroi e Um Alienigina?"
                  (Leaf (Right Quasar))
                  (Node "O heroi e Uma arvore?"
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


    -- Exemplo de codigo
   {--(Node "O heroi que voce esta pensando e humano?" 
      (Node  "O heroi que voce esta pensando usa armas?" 
        (Leaf (Right Batman))
        (Node "O heroi que voce esta pensando e ciborgue?" 
          (Leaf (Right Cyborg))
          (Leaf (Right CanarioNegro))))
      (Node "O heroi que voce esta pensando tem habilidades sobre-humanas?" 
        (Node "O heroi que voce esta pensando e extremamente rapido?" 
          (Leaf (Right Flash))
          (Node "O heroi que voce esta pensando e um marciano?" 
            (Leaf (Right CacadorDeMarte))
            (Leaf (Right LanternaVerde))))
        (Node "O heroi que voce esta pensando e um atlante?" 
          (Leaf (Right Aquaman))
          (Leaf (Left "Desculpe, nao consegui identificar o heroi que voce esta pensando.")))))   -}

parseTree :: String -> Tree (Either String Hero) -> Either Hero (Tree (Either String Hero))
parseTree _ (Leaf (Right hr)) = Left hr
parseTree ans (Node _ lftree rgtree) = case ans of
  "sim" -> Right lftree
  "nao" -> Right rgtree
  _     -> Left InvalidAnswer

-- | Executa o jogo e retorna o heroi escolhido pelo usuario
runGame :: Tree (Either String Hero) -> IO Hero
runGame (Leaf (Left message)) = do
  putStrLn message
  runGame tree
runGame (Leaf (Right hero)) = do
  -- | putStrLn ("O heroi em que voce esta pensando e " ++ show hero ++ ".")
  return hero
runGame (Node question left right) = do
  putStrLn question
  answer <- getLine
  case answer of
    "sim" -> runGame left
    "nao" -> runGame right
    _     -> return InvalidAnswer
