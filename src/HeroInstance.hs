module HeroInstance where

import Hero

data HeroInstance = HeroInstance {hero :: Hero, name :: String, imgPath :: String} 
  deriving (Show)

baseImgPath = "./img/"

mulherMaravilha :: HeroInstance
mulherMaravilha = HeroInstance{hero = MulherMaravilha, name = "Mulher Maravilha", imgPath = baseImgPath ++ "mulherMaravilha.png"}

{--heroes :: [HeroIn] --}
