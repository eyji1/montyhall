# montyhall

An R package that simulates the classic **Monty Hall problem**, a probability puzzle demonstrating that switching doors increases the probability of winning.

This package provides a simple, modular implementation of the Monty Hall game, making it useful for teaching probability, decision-making under uncertainty, and simulation concepts.

---

##  Package Overview

The Monty Hall problem involves three doors:
- One door hides a prize
- Two doors hide goats
- After a player selects a door, the host opens a different door revealing a goat
- The player may either **stay** with their original choice or **switch** to the remaining unopened door

Counterintuitively, switching doors results in a higher probability of winning.

---

##  Functions

The package is organized into small, clearly defined functions that mirror the steps of the game:

- **`create_game()`**  
  Randomly assigns the prize behind one of three doors.

- **`select_door()`**  
  Simulates the player’s initial door selection.

- **`open_goat_door()`**  
  Determines which non-selected door the host opens to reveal a goat.

- **`change_door()`**  
  Switches the player’s choice to the remaining unopened door.

- **`determine_winner()`**  
  Evaluates whether the selected door contains the prize.

- **`play_game()`**  
  Runs a complete Monty Hall simulation and compares outcomes for:
  - Staying with the original door
  - Switching to the other door

---

##  Example Usage

```r
library(montyhall)

play_game()
