#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
  then

    if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT 
                          atomic_number,
                          symbol,
                          name,
                          type,
                          atomic_mass,
                          melting_point_celsius,
                          boiling_point_celsius
                      FROM elements 
                      INNER JOIN properties USING (atomic_number)
                      INNER JOIN types USING(type_id)
                      WHERE name = '$1' 
                            OR symbol = '$1';"
                            )
    else   
      ELEMENT=$($PSQL "SELECT 
                          atomic_number,
                          symbol,
                          name,
                          type,
                          atomic_mass,
                          melting_point_celsius,
                          boiling_point_celsius
                      FROM elements 
                      INNER JOIN properties USING (atomic_number) 
                      INNER JOIN types USING(type_id)
                      WHERE atomic_number = $1;"
                            )
    fi                                   

    if [[ $ELEMENT ]]
    then
      echo $ELEMENT | while IFS="|" read  NUMBER SYMBOL NAME TYPE MASS MELTING BOILING
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  else
    echo "Please provide an element as an argument."
fi