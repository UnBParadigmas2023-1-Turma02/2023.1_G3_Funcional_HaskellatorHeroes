module HeroInstance where

import Hero
import System.FilePath (pathSeparator)
import Data.String
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
    arqv = HeroInstance ArqueiroVerde "Arqueiro Verde" $ bmpFolder ++ "arqueiroverde.bmp"
    btg = HeroInstance Batgirl "Bat Girl" $ bmpFolder ++ "batgirl_2.bmp"
    btm = HeroInstance Batman "Batman" $ bmpFolder ++ "Batman.bmp"
    bld = HeroInstance Blade "Blade" $ bmpFolder ++ "Blade.bmp"
    cmrt = HeroInstance CacadorDeMarte "Cacador de Marte" $ bmpFolder ++ "cacadorMarte.bmp"
    cng = HeroInstance CanarioNegro "Canario Negro " $ bmpFolder ++ "canarioNegro.bmp"
    cptam = HeroInstance CapitaoAmerica "Capitao America" $ bmpFolder ++ "cpt_america.bmp"
    cyb = HeroInstance Ciborgue "Ciborgue" $ bmpFolder ++ "Cyborg.bmp"
    dem = HeroInstance Demolidor "Demolidor" $ bmpFolder ++ "demolidor.bmp"
    drm = HeroInstance DrMeiaNoite "Dr. Meia Noite" $ bmpFolder ++ "DrMeiaNoite.bmp"
    flc = HeroInstance Falcao "Falcao" $ bmpFolder ++ "falcao.bmp"
    fls = HeroInstance Flash "Flash" $ bmpFolder ++ "flash.bmp"
    gmr = HeroInstance Gamora "Gamora" $ bmpFolder ++ "Gamora.bmp"
    gva = HeroInstance GaviaoArqueiro "Gaviao Arqueiro" $ bmpFolder ++ "gaviao_arqueiro.bmp"
    grt = HeroInstance Groot "Groot" $ bmpFolder ++ "groot.bmp"
    her = HeroInstance Hercules "Hercules" $ bmpFolder ++ "hercules.bmp"
    hel = HeroInstance HomemElastico "Homem Elastico" $ bmpFolder ++ "homemElastico.bmp"
    irm = HeroInstance HomemDeFerro "Homem de Ferro" $ bmpFolder ++ "ironman.bmp"
    jng = HeroInstance JeanGrey "Jean Grey" $ bmpFolder ++ "jeanGray.bmp"
    jsj = HeroInstance JessicaJones "Jessica Jones" $ bmpFolder ++ "jessica_jones.bmp"
    jst = HeroInstance Justiceiro "Justiceiro" $ bmpFolder ++ "justiceiro.bmp"
    lnv = HeroInstance LanternaVerde "Lanterna Verde" $ bmpFolder ++ "lanternaVerde.bmp"
    nuc = HeroInstance Nuclear "Nuclear" $ bmpFolder ++ "nuclear.bmp"
    pcd = HeroInstance Pacificador "Pacificador" $ bmpFolder ++ "pacificador.bmp"
    qs = HeroInstance Quasar "Quasar" $ bmpFolder ++ "Quasar.bmp"
    rr = HeroInstance RocketRaccoon "Rocket Raccoon" $ bmpFolder ++ "rocket_raccoon.bmp"
    srd = HeroInstance SrDestino "Sr. Destino" $ bmpFolder ++ "SrDestino.bmp"
    scq = HeroInstance SuperChoque "Super Choque" $ bmpFolder ++ "superChoque.bmp"
    spm = HeroInstance Superman "Superman" $ bmpFolder ++ "Superman.bmp"
    tms = HeroInstance Tempestade "Tempestade" $ bmpFolder ++ "Tempestade.bmp"
    thr = HeroInstance Thor "Thor" $ bmpFolder ++ "Thor.bmp"
    vsp = HeroInstance Vespa "Vespa" $ bmpFolder ++ "vespa.bmp"
    vsa = HeroInstance Visao "Visao" $ bmpFolder ++ "visao.bmp"
    vn = HeroInstance ViuvaNegra "Viuva Negra" $ bmpFolder ++ "viuva_negra.bmp"
    wv = HeroInstance Wolverine "Wolverine" $ bmpFolder ++ "wolverine.bmp"
    zt = HeroInstance Zattana "Zattana" $ bmpFolder ++ "zattana.bmp"

    heroList = [bld, mm, arqv, btg, btm, bld, cmrt, cng, cptam, cyb, dem, drm, flc, fls, gmr, gva, grt, her, hel, irm, jng, jsj, jst, lnv, nuc, pcd, qs, rr, srd, scq, spm, tms, thr, vsp, vsa, vn, wv, zt]

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
  

