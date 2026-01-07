#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

USERID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ ! $USERID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')") 
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) from games WHERE user_id = $USERID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) AS best_game FROM games WHERE user_id = $USERID")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


N=$((RANDOM % 1000))
TRIES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $N ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:\n"
  else
    if [[ $GUESS -lt $N ]]
    then
      echo -e "It's lower than that, guess again:\n"
    else
      echo -e "It's higher than that, guess again:\n"
    fi
  fi
  read GUESS
  ((TRIES++))
done

USERID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USERID,$TRIES)")
echo $USERINFO | while IFS="|" read NAME GAMES_PLAYED BEST_GAME
  do
    GAMES_PLAYED=$(($GAMES_PLAYED+1))

    if [[ $TRIES -lt $BEST_GAME ]] || [[ $BEST_GAME -eq 0 ]]
    then
      UPDATE_GAME_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $TRIES WHERE username = '$NAME'")
    else
      UPDATE_GAME_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username = '$NAME'")
    fi
  done

echo -e "\nYou guessed it in $TRIES tries. The secret number was $N. Nice job! and finish"

