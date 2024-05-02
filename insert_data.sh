#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# $($PSQL "<query_here>")

# Clear out old data
HIDE=$($PSQL "TRUNCATE teams, games")
HIDE=$($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
HIDE=$($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")

# Loop through file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != year ]]
    then
      # Insert winning team to teams table if necessary
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'");
      if [[ -z $WINNER_ID ]]
      then
        HIDE=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'");
        #echo "INSERTED $WINNER WITH team_id $WINNER_ID"
      fi

      # insert losing team to teams table if necessary
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'");
      if [[ -z $OPPONENT_ID ]]
      then
        HIDE=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'");
        #echo "INSERTED $OPPONENT WITH team_id $OPPONENT_ID"
      fi

      #insert game to games table
      HIDE=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
       VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
      

  done
# test psql handler
