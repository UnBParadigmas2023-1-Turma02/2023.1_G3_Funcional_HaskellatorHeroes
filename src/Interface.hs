module Interface where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss.Data.Bitmap

import Hero
import Tree

main :: IO()
main = do 
    let window = InWindow "Heroes" (600,400) (0,0)
        initialPosition = -20
    backgroundImage <- loadBMP "./bmp/picture.bmp"
    playIO window white 30 initialState (draw backgroundImage) (handleEvent) update


data State = State { choice :: Maybe Bool, question :: String, finished :: Bool }

getInitialPosition :: Float
getInitialPosition = -20

getWidithButton :: Float
getWidithButton = 150

getHeightButton :: Float
getHeightButton = 50

setQuestion :: State -> ()
setQuestion state = state { question = question }

-- getState :: State
-- getState = 

-- getState :: State
-- getState = 

initialState :: State
initialState = State { choice = Nothing, question = "O seu personagem consegue ler mentes?", finished = False }

draw :: Picture -> State -> IO Picture
draw backgroundImage state = do
  let widthButton = 150
      questionSpace = roundedTextfield (question state) cyan (0, getInitialPosition + 185) 250 110
      finishedState = finished state
      buttonToShow = if finishedState
                        then roundedButton "Reiniciar" yellow (0, getInitialPosition) 170 50
                        else Pictures [
                                roundedButton "Sim" (light green) (0, getInitialPosition) widthButton 50,
                                roundedButton "Nao" (dim red) (0, getInitialPosition-70) widthButton 50
                            ]
  return $ Pictures [backgroundImage, buttonToShow, questionSpace]

drawTextfield :: String -> State -> IO Picture
drawTextfield text state = do
    let questionSpace = roundedTextfield text cyan (0, getInitialPosition + 185) 250 210
    return $ Pictures [questionSpace]

-- Precisa virar rounded
roundedButton :: String -> Color -> Point -> Float -> Float -> Picture
roundedButton label color (x, y) width height = do
  let rect = Translate x y $ Color color $ rectangleSolid width height
  if(label == "Reiniciar")
    then 
      Pictures [rect, Translate (x - width/2 + 10) (y - height / 4) $ Scale 0.3 0.3 $ boldText label]
    else
      Pictures [rect, Translate (x - width/2 + 35) (y - height / 4) $ Scale 0.3 0.3 $ boldText label]

-- Precisa virar rounded
roundedTextfield :: String -> Color -> Point -> Float -> Float -> Picture
roundedTextfield label color (x, y) width height = do
  let test = splitInto30CharStrings label
  Pictures [
      Translate x (y - 25) $ Color color $ rectangleSolid width height,
      createLines (tail test) color (x,y) width height (Translate (x - width/2 + 3) (y+3) $ Scale 0.12 0.12 $ Text (head test)) 0 (y-20)
    ]

splitInto30CharStrings :: String -> [String]
splitInto30CharStrings str = go (words str) []
  where
    go :: [String] -> [String] -> [String]
    go [] acc = reverse acc
    go (x:xs) [] = go xs [x]
    go (x:xs) (y:ys)
      | length x + length y + 1 <= 28 = go xs ((y ++ " " ++ x):ys)
      | length x <= 28 = go xs (x:y:ys)
      | otherwise = let (chunk, rest) = splitAt 28 x
                    in go (chunk:rest:xs) (y:ys)

boldText :: String -> Picture
boldText s = Color black $ Text s

createLines :: [String] -> Color -> Point -> Float -> Float -> Picture -> Int -> Float-> Picture
createLines label color (x,y) width height picture counter initialPosition =
  if (counter < 3 && (length label) > 0)
     then do
     let z = Pictures [ picture, Translate (x - width/2 + 3) (initialPosition) $ Scale 0.12 0.12 $ Text (head label)]
     createLines (tail label) color (x,y) width height z (counter+1) (initialPosition-20)
  else
     picture
     
distX :: Point -> Point -> Float
distX (x1, _) (x2, _) = abs (x1 - x2)
  
distY :: Point -> Point -> Float
distY (_, y1) (_, y2) = abs (y1 - y2)

handleEvent :: Event -> State -> IO State
handleEvent (EventKey (MouseButton LeftButton) Down _ (x, y)) state = do
  let yesButton = (0, getInitialPosition)
      noButton = (0, getInitialPosition - 70)
      finishedState = finished state
      choice
        | distY (x, y) yesButton < (getHeightButton / 2) && distX (x, y) yesButton < (getWidithButton / 2) = Just True
        | distY (x, y) noButton < (getHeightButton / 2) && distX (x, y) noButton < (getWidithButton / 2) = Just False
        | otherwise = Nothing
  case finishedState of
    True -> if(distY (x, y) yesButton < (getHeightButton / 2) && distX (x, y) yesButton < (170 / 2))
            then
              return $ state { finished = False }
            else  
              return $ state
    False -> return $ changeQuestion choice state
handleEvent _ state = return state

update :: Float -> State -> IO State
update _ state = return state 

changeQuestion :: Maybe Bool -> State -> State
changeQuestion choice state
  | choice == Just True = runGame "sim"
   -- state { question = fst rightTree, finished = snd rightTree }
  | choice == Just False = state { question = fst leftTree, finished = snd leftTree }
  | otherwise = state
  where
    rightTree = getRightTree
    leftTree = getLeftTree

getRightTree :: (String, Bool)
getRightTree = ("O seu personagem eh o Superman!", True)

getLeftTree :: (String, Bool)
getLeftTree = ("O seu personagem eh o homem-aranha?", False)

    
-- putStrLn $ "Choice: " ++ show choice