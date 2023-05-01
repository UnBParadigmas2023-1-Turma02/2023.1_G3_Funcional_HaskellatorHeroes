-- Módulo Hero
module Hero where

-- | Heróis presentes no jogo (Heróis exemplo)
data Hero = Batman | Superman | MulherMaravilha | Flash | Aquaman | LanternaVerde | CacadorDeMarte | MulherGaviao | Cyborg | CanarioNegro | Batgirl | Zattana | Ciborgue | SuperChoque | DrDestino | Nuclear | HomemElastico | DrMeiaNoite | ArqueiroVerde | Pacificador | Visao | Hercules | Thor | CapitaoAmerica | HomemDeFerro | Wolverine | Demolidor | Blaide | GaviaoArqueiro | Falcao | Justiceiro | Groot | Quasar | RocketRaccoon | ViuvaNegra | Vespa | Gamora | Tempestade | JeanGrey | JessicaJones | InvalidAnswer
  deriving (Show, Eq)

data Characteristic = Voa | SuperForça | Arma | Teleporte | Rapido | FalaComAnimais | RespiraDebaixoDagua | SuperSentidos | FatorDeCura | SuperInteligencia
  deriving (Show, Eq)


-- | Um dicionário que associa cada herói com um conjunto de características
heroCharacteristics :: Hero -> [Characteristic]
heroCharacteristics Batman = [Arma]
heroCharacteristics Superman = [Voa, SuperForça, SuperSentidos, FatorDeCura]
heroCharacteristics MulherMaravilha = [Voa, SuperForça, Arma, SuperSentidos]
heroCharacteristics Flash = [Rapido]
heroCharacteristics Aquaman = [FalaComAnimais, RespiraDebaixoDagua, SuperForça]
heroCharacteristics LanternaVerde = [Arma]
heroCharacteristics CacadorDeMarte = [Teleporte, SuperForça, SuperSentidos]
heroCharacteristics MulherGaviao = [Voa, Arma, SuperForça]
heroCharacteristics Cyborg = [Arma, SuperForça]
heroCharacteristics CanarioNegro = [Arma, SuperSentidos]
