# Peg-Reversal-Game

**Flipping Pegs** is a simple single-player board game where the player flips the colors of pegs on a '+' shaped board. The objective is to turn all the black pegs white by making strategic moves. The game is won when all pegs on the board are flipped to white.

## Game Overview

- The game is played on a board shaped like a '+' sign, with the middle position being (0,0). All other positions are relative to the center.
- At the start of the game, all pegs are black except one, which is white. The initial white peg can be placed anywhere on the board.
- The player can flip black pegs to white according to specific rules.

![image](https://github.com/user-attachments/assets/18077c4b-636f-490f-abf0-94f545678a05)


### Game Rules

1. **Starting Board Configuration**:
   - The board has a '+' shape with the center at (0,0).
   - All pegs start as black except one white peg, which is randomly or manually placed.

2. **Making a Move**:
   - A move consists of flipping a black peg to white.
   - To flip a black peg, the following conditions must be met:
     - The peg itself is black (white pegs cannot be flipped back to black).
     - At least one adjacent peg (up, down, left, or right) is white. Diagonals are not considered.

3. **Winning Condition**:
   - The player wins if all pegs on the board are flipped to white.

## Key Features

- **Dynamic Board Setup**: Board initialized with all black pegs except one random or user-defined white peg.
- **Valid Moves Checking**: Check if a move is valid based on adjacent white pegs.
- **Game State Management**: Display all possible game states reachable from the current state.
- **Win Condition Evaluation**: Automatically checks if all pegs have been flipped to white.

## Contact

For questions or feedback, please contact [roger.elias669@gmail.com](mailto:roger.elias669@gmail.com).
