
type Position = (Int,Int)
data Color = W | B deriving (Eq, Show)
data Peg = Peg Position Color deriving (Eq, Show)
data Move = M Position deriving (Eq, Show)
type Board = [Peg]
data State = S Move Board deriving (Eq, Show)
--____________________________________________________________
-- function a

createBoard:: Position -> Board

createBoard pos
    | not (isValidPosition pos) = error "The position is not valid."
    | otherwise = [Peg p (if p == pos then W else B) | p <- validPositions]


validPositions :: [Position]

validPositions = [(-3,r)| r<-[-1..1]] ++ [(-2,r)| r<-[-1..1]] ++ [(c,r)| r<-[-3..3] , c<-[-1,1]] ++ [(3,r)| r<-[-1..1]] ++ [(2,r)| r<-[-1..1]]

isValidPosition :: Position -> Bool
isValidPosition p = p `elem` validPositions
--____________________________________________________________
-- function b

findPeg :: Position -> Board ->  Peg
findPeg _ [] = Peg (-90,-90) B
findPeg pos (Peg p c : ps)
    | pos == p  = Peg p c
    | otherwise = findPeg pos ps

getColor :: Peg -> Color

getColor (Peg pos c) = c

isValidMove:: Move -> Board -> Bool

isValidMove (M (c,r)) board
    | getColor (findPeg (c,r) board) == W  = False
    | getColor (findPeg (c-1,r) board ) == W = True
    | getColor (findPeg (c+1,r) board ) == W = True
    | getColor (findPeg (c,r-1) board ) == W = True
    | getColor (findPeg (c,r+1) board ) == W = True
    | otherwise = False
--____________________________________________________________
-- function c
isGoal :: Board -> Bool
isGoal [] = True
isGoal (Peg _ W : xs) = isGoal xs 
isGoal _ = False 
--____________________________________________________________
-- function d 
flipPegToWhite :: Position -> Board -> Board
flipPegToWhite pos = map (\(Peg p c) -> if p == pos then Peg p W else Peg p c)

generateMoves :: Board -> [Move]
generateMoves = map (\(Peg pos _) -> M pos)

showPossibleNextStates:: Board -> [State]
showPossibleNextStates board
    | isGoal board = error "No Possible States Exist."
    | otherwise = [ S move (flipPegToWhite pos board)
                  | move@(M pos) <- generateMoves board
                  , isValidMove move board ]
