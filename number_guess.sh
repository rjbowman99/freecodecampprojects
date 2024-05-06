#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

RANDOM_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_ID=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  #if [[ -z $GAMES_PLAYED ]]
  #then
  #  GAMES_PLAYED=0
  #fi
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
  #if [[ -z $BEST_GAME ]]
  #then
  #  BEST_GAME=0
  #fi
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

NUM_GUESSES=1

while [ "$USER_GUESS" != "$RANDOM_NUMBER" ]
do
  REGEX_CHECK='^[0-9]+$'
  if [[ $USER_GUESS =~ $REGEX_CHECK ]]
  then
    if [ "$USER_GUESS" -lt "$RANDOM_NUMBER" ]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
  read USER_GUESS
  NUM_GUESSES=$((NUM_GUESSES+1))
done

GAME_INSERT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUM_GUESSES)")
echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
