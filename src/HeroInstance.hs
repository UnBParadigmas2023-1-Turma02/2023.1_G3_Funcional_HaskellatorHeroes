module HeroInstance where

import Hero
import System.FilePath (pathSeparator)
import qualified Data.Map as M

data HeroInstance = HeroInstance {hero :: Hero, name :: String, imgPath :: String} 
  deriving (Show)

basePath = ".." ++ [pathSeparator] ++ "img" ++ [pathSeparator]
bmpFolder = "." ++ [pathSeparator] ++ "bmp" ++ [pathSeparator]

heroesData :: M.Map Hero (String, String)
heroesData = M.fromList $ map (\x -> (hero x, (name x, imgPath x))) heroList
  where
    mm :: HeroInstance 
    mm = HeroInstance{hero = MulherMaravilha, name = "Mulher Maravilha", imgPath = bmpFolder ++ "mulherMaravilha.bmp"}

    bld :: HeroInstance
    bld = HeroInstance Blade "Blade" "Blade.bmp"

    --Continua


    heroList = [bld, mm]

getHeroName :: Hero -> String
getHeroName hero = case M.lookup hero heroesData of
  Just (x, _) -> x
  Nothing -> ""

getHeroImg :: Hero -> String
getHeroImg hero = case M.lookup hero heroesData of 
  Just (_, y) -> y
  Nothing -> ""

testMap = print imgPath
  where 
    (_, imgPath) = heroesData M.! MulherMaravilha
  

