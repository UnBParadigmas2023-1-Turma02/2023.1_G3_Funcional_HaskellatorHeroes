module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.Bitmap
import Graphics.Gloss.Interface.IO.Game

import Interface

main :: IO ()
main = do
  let window = InWindow "Heroes" (600, 400) (0, 0)
      initialPosition = -20
  backgroundImage <- loadBMP "./bmp/picture.bmp"
  playIO window white 30 initialState (draw backgroundImage) handleEvent update
