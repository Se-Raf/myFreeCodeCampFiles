#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    echo "|$YEAR | $ROUND | $WINNER | $OPPONENT | $WINNER_GOALS | $OPPONENT_GOALS |"
    #insert teams
    #team_id, name

    #WinnerId
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    #if winner id does not exist
    if [[ -z $WINNER_ID ]]
    then
      #insert
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")

      #get id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams  WHERE name = '$WINNER'")
    fi

    #OpponentId
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams  WHERE name = '$OPPONENT'")
    #if opponent id does not exist
    if [[ -z $OPPONENT_ID ]]
    then
      #insert
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")

      #get id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams  WHERE name = '$OPPONENT'")
    fi

    #insert games
    #game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                                            VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  fi
done