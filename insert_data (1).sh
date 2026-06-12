#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY CASCADE")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $TEAM_ID_W ]]
    then
      INSERT_TEAM_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_W = "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $WINNER"
      fi
      TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi
    if [[ -z $TEAM_ID_O ]]
    then
      INSERT_TEAM_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_O = "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $OPPONENT"
      fi
      TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi
    GAME_ID=$($PSQL "SELECT game_id FROM games AS g INNER JOIN teams AS tw ON g.winner_id = tw.team_id INNER JOIN teams AS tp ON g.opponent_id = tp.team_id WHERE g.year = $YEAR AND g.round = '$ROUND' AND tw.name = '$WINNER' AND tp.name = '$OPPONENT'")
    if [[ -z $GAME_ID ]]
    then
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id,opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_W, $TEAM_ID_O, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME_RESULT = "INSERT 0 1" ]]
      then
        echo "Inserted into games: $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS"
      fi
    fi
  fi
done