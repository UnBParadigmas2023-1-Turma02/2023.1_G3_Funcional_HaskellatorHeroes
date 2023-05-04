module Interface where

import Graphics.Gloss
import Graphics.Gloss.Data.Bitmap
import Graphics.Gloss.Interface.IO.Game
import Hero
import Tree (Tree(..), parseTree, tree, firstQuestion)

data State = State {choice :: String, question :: String, finished :: Bool, herotree :: Tree (Either String Hero), backGroundState :: String}

getInitialPosition :: Float
getInitialPosition = -20

getWidithButton :: Float
getWidithButton = 150

getHeightButton :: Float
getHeightButton = 50

setQuestion :: State -> String -> State
setQuestion state qt = state {question = qt}

initialState :: State
initialState = State {choice = "", question = firstQuestion, finished = False, herotree = tree, backGroundState = "./bmp/background1.bmp"}

draw :: State -> IO Picture
draw state = do
  let widthButton = 150
  backgroundImage <- loadBMP (backGroundState state)
  if not (finished state)
    then
      case backGroundState state of
        ("./bmp/background1.bmp") -> do
          let buttonToShow = roundedButton "Iniciar" green (0, getInitialPosition) 170 50
          return $ Pictures [backgroundImage, buttonToShow]
        ("./bmp/background2.bmp") -> do
          let buttonToShow = Pictures[ roundedButton "Sim" (light green) (0, getInitialPosition) widthButton 50, roundedButton "Nao" (dim red) (0, getInitialPosition - 70) widthButton 50]
              questionSpace = roundedTextfield (question state) cyan (0, getInitialPosition + 185) 250 110
          return $ Pictures [backgroundImage, buttonToShow, questionSpace]
    else do
      let buttonToShow = roundedButton "Reiniciar" yellow (0, getInitialPosition) 170 50
          questionSpace = roundedTextfield (question state) cyan (0, getInitialPosition + 185) 250 110
      return $ Pictures [backgroundImage, buttonToShow, questionSpace]
      
yesButtonPos :: (Float, Float)
yesButtonPos = (0, getInitialPosition)

noButtonPos :: (Float, Float)
noButtonPos = (0, getInitialPosition - 70)

drawTextfield :: String -> State -> IO Picture
drawTextfield text state = do
  let questionSpace = roundedTextfield text cyan (0, getInitialPosition + 185) 250 210
  return $ Pictures [questionSpace]

-- Precisa virar rounded
roundedButton :: String -> Color -> Point -> Float -> Float -> Picture
roundedButton label color (x, y) width height = do
  let rect = Translate x y $ Color color $ rectangleSolid width height
  if label == "Reiniciar"
    then Pictures [rect, Translate (x - width / 2 + 10) (y - height / 4) $ Scale 0.3 0.3 $ boldText label]
    else Pictures [rect, Translate (x - width / 2 + 35) (y - height / 4) $ Scale 0.3 0.3 $ boldText label]

-- Precisa virar rounded
roundedTextfield :: String -> Color -> Point -> Float -> Float -> Picture
roundedTextfield label color (x, y) width height = do
  let test = splitInto30CharStrings label
  Pictures
    [ Translate x (y - 25) $ Color color $ rectangleSolid width height,
      createLines (tail test) color (x, y) width height (Translate (x - width / 2 + 3) (y + 3) $ Scale 0.12 0.12 $ Text (head test)) 0 (y - 20)
    ]

splitInto30CharStrings :: String -> [String]
splitInto30CharStrings str = go (words str) []
  where
    go :: [String] -> [String] -> [String]
    go [] acc = reverse acc
    go (x : xs) [] = go xs [x]
    go (x : xs) (y : ys)
      | length x + length y + 1 <= 28 = go xs ((y ++ " " ++ x) : ys)
      | length x <= 28 = go xs (x : y : ys)
      | otherwise =
          let (chunk, rest) = splitAt 28 x
           in go (chunk : rest : xs) (y : ys)

boldText :: String -> Picture
boldText s = Color black $ Text s

createLines :: [String] -> Color -> Point -> Float -> Float -> Picture -> Int -> Float -> Picture
createLines label color (x, y) width height picture counter initialPosition =
  if counter < 3 && not (null label)
    then do
      let z = Pictures [picture, Translate (x - width / 2 + 3) initialPosition $ Scale 0.12 0.12 $ Text (head label)]
      createLines (tail label) color (x, y) width height z (counter + 1) (initialPosition - 20)
    else picture

distX :: Point -> Point -> Float
distX (x1, _) (x2, _) = abs (x1 - x2)

distY :: Point -> Point -> Float
distY (_, y1) (_, y2) = abs (y1 - y2)

checkYesArea :: (Float, Float) -> Bool
checkYesArea (x, y) = checkButtonArea (x, y) yesButtonPos getHeightButton getWidithButton

checkNoArea :: (Float, Float) -> Bool
checkNoArea (x, y) = checkButtonArea (x, y) noButtonPos getHeightButton getWidithButton

checkStartArea :: (Float, Float) -> Bool
checkStartArea (x, y) = checkButtonArea (x, y) yesButtonPos getHeightButton 170

checkButtonArea :: Point -> Point -> Float -> Float -> Bool
checkButtonArea coord fixed height width = 
  distY coord fixed < (height / 2) && distX coord fixed < (width / 2)

handleEvent :: Event -> State -> IO State
-- handleEvent (EventKey (MouseButton LeftButton) Down _ (x, y)) state = do
--   let yesButton = (0, getInitialPosition)
--       noButton = (0, getInitialPosition - 70)
--       finishedState = finished state
--       choice
--         | distY (x, y) yesButton < (getHeightButton / 2) && distX (x, y) yesButton < (getWidithButton / 2) = Just True
--         | distY (x, y) noButton < (getHeightButton / 2) && distX (x, y) noButton < (getWidithButton / 2) = Just False
--         | otherwise = Nothing
--   if finishedState then
--     if distY (x, y) yesButton < (getHeightButton / 2) && distX (x, y) yesButton < (170 / 2)
--       then return $ state {finished = False}
--       else return state
--     else return $ changeQuestion choice state
-- handleEvent _ state = return state

handleEvent (EventKey (MouseButton LeftButton) Down _ (x, y)) gamestate = do
  if backGroundState gamestate == "./bmp/background1.bmp" && checkStartArea (x, y)
    then
      return gamestate {backGroundState = "./bmp/background2.bmp"}
  else
    let finishedState = finished gamestate
        questionState = question gamestate
        tree          = herotree gamestate
        clickChoice
          | checkYesArea (x, y) = "sim" 
          | checkNoArea  (x, y) = "não"
          | otherwise           = ""
        newTree
          | not (null clickChoice) = parseTree clickChoice tree 
          | otherwise              = Right tree
      in 
        case newTree of
          (Right (Node str left rgt)) -> return gamestate {herotree = Node str left rgt, question = str}
          (Right (Leaf (Right hero))) -> return gamestate {finished = True, herotree = tree, question = show hero}
          (Left hr)                   -> return gamestate {finished = True, question = show hr}
handleEvent _ state = return state

update :: Float -> State -> IO State
update _ state = return state

{--
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

--}
-- putStrLn $ "Choice: " ++ show choice
