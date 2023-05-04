module HeroInstance where

import Hero
import System.FilePath (pathSeparator)

data HeroInstance = HeroInstance {hero :: Hero, name :: String, imgPath :: String} 
  deriving (Show)

baseImgPath = "img" ++ [pathSeparator]

mulherMaravilha :: HeroInstance
mulherMaravilha = HeroInstance{hero = MulherMaravilha, name = "Mulher Maravilha", imgPath = baseImgPath ++ "mulherMaravilha.png"}

{--heroes :: [HeroIn] --}
