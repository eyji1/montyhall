#' Create a 3-door Monty Hall game
#'
#' Generates a random arrangement of two goats and one car behind three doors.
#'
#' @return A character vector of length 3 containing two `"goat"` values and one `"car"`.
#'
#' @examples
#' create_game()
#'
#' @export
create_game <- function()
{
  a.game <- sample(x = c("goat","goat","car"), size = 3, replace = FALSE)
  return(a.game)
}

#' Randomly select one of three doors
#'
#' Randomly selects a door number from 1 to 3.
#'
#' @return An integer (1, 2, or 3) representing the contestant's initial pick.
#'
#' @examples
#' select_door()
#'
#' @export
select_door <- function() {
  doors <- c(1, 2, 3)
  a.pick <- sample(doors, size = 1)
  return(a.pick)
}

#' Host opens a goat door (3-door game)
#'
#' Given a game layout and the contestant's initial pick, the host opens a door
#' that was not picked and contains a goat.
#'
#' @param game A character vector representing the game layout (e.g., from `create_game()`).
#' @param a.pick The contestant's initial door selection (integer).
#'
#' @return An integer door number opened by the host.
#'
#' @examples
#' g <- create_game()
#' p <- select_door()
#' open_goat_door(g, p)
#'
#' @export
open_goat_door <- function(game, a.pick) {

  # ensure a.pick is a single integer door index
  a.pick <- as.integer(a.pick[1])

  doors <- seq_along(game)  # 1:3

  # host can open only doors that are NOT the pick and have a goat
  goat.doors <- doors[doors != a.pick & game == "goat"]

  opened.door <- sample(goat.doors, size = 1)
  return(as.integer(opened.door))
}

#' Stay or switch doors (3-door game)
#'
#' Returns the contestant's final pick depending on whether they stay with the
#' original selection or switch to the remaining unopened door.
#'
#' @param stay Logical. If `TRUE`, contestant stays with the original pick. If `FALSE`, switches.
#' @param opened.door Integer. The door opened by the host.
#' @param a.pick Integer. The contestant's original pick.
#'
#' @return An integer representing the contestant's final pick.
#'
#' @examples
#' g <- create_game()
#' p <- select_door()
#' o <- open_goat_door(g, p)
#' change_door(TRUE,  o, p)
#' change_door(FALSE, o, p)
#'
#' @export
change_door <- function(stay = TRUE, opened.door, a.pick) {

  opened.door <- as.integer(opened.door[1])
  a.pick <- as.integer(a.pick[1])

  if (stay) {
    final.pick <- a.pick
  } else {
    final.pick <- setdiff(1:3, c(opened.door, a.pick))
    final.pick <- as.integer(final.pick[1])
  }

  return(final.pick)
}

#' Determine whether the contestant wins
#'
#' Checks whether the contestant's final pick corresponds to the car.
#'
#' @param final.pick Integer. The contestant's final selected door.
#' @param game Character vector. The game layout.
#'
#' @return A character string `"WIN"` if the selected door has the car, otherwise `"LOSE"`.
#'
#' @examples
#' g <- create_game()
#' p <- select_door()
#' o <- open_goat_door(g, p)
#' f <- change_door(FALSE, o, p)
#' determine_winner(f, g)
#'
#' @export
determine_winner <- function(final.pick, game) {

  final.pick <- as.integer(final.pick[1])

  if (game[final.pick] == "car") {
    return("WIN")
  } else {
    return("LOSE")
  }
}

#' Play one complete 3-door Monty Hall game
#'
#' Plays one game and returns the outcomes for both strategies:
#' staying and switching.
#'
#' @return A data frame with two rows and columns `strategy` and `outcome`.
#'
#' @examples
#' play_game()
#'
#' @export
play_game <- function()
{
  new.game          <- create_game()
  first.pick        <- select_door()
  opened.door       <- open_goat_door(new.game, first.pick)
  final.pick.stay   <- change_door(stay = TRUE,  opened.door = opened.door, a.pick = first.pick)
  final.pick.switch <- change_door(stay = FALSE, opened.door = opened.door, a.pick = first.pick)
  outcome.stay      <- determine_winner(final.pick.stay,   new.game)
  outcome.switch    <- determine_winner(final.pick.switch, new.game)

  strategy     <- c("stay", "switch")
  outcome      <- c(outcome.stay, outcome.switch)
  game.results <- data.frame(strategy, outcome)

  return(game.results)
}

#' Create a 5-door Monty Hall game (3 goats, 2 cars)
#'
#' Generates a random arrangement of 3 goats and 2 cars behind five doors.
#'
#' @return A character vector of length 5.
#'
#' @examples
#' create_game_5()
#'
#' @export
create_game_5 <- function()
{
  sample(x = c(rep("goat", 3), rep("car", 2)), size = 5, replace = FALSE)
}

#' Randomly select one door from 1 to n
#'
#' @param n Integer. Number of doors.
#'
#' @return An integer door
