#!/bin/bash
#
# This script implements a guessing game
# it will pick a secret number from 1 to 10
# it will then repeatedly ask the user to guess the number
#    until the user gets it right

# Give the user instructions for the game
cat <<EOF
Let's play a game.
I will pick a secret number from 1 to 10 and you have to guess it.
If you get it right, you get a virtual prize.
Here we go!

EOF

# Pick the secret number and save it
secretnumber=$(($RANDOM % 10 +1)) # save our secret number to compare later

# This loop repeatedly asks the user to guess and tells them if they got the right answer
# TASK 1: Test the user input to make sure it is not blank
# TASK 2: Test the user input to make sure it is a number from 1 to 10 inclusive
# TASK 3: Tell the user if their guess is too low, or too high after each incorrect guess

#Moving the first read command within the loop prevents duplication of logic and enables easy
#validation of the first number provided by the user
userguess=null
while [ $userguess != $secretnumber ]; do
  read -p "Give me a number from 1 to 10: " userguess
    if [ -z $userguess ]; then
      echo "Value entered cannot be blank!"
      userguess=null
      continue
    elif [ $userguess -ge 11 -o $userguess -le 0 ]; then
      echo "Value entered must be between 1 and 10"
      continue
    elif [ $userguess -lt $secretnumber ]; then
      echo "Your guess was too low"
    elif [ $userguess -gt $secretnumber ]; then
      echo "Your guess was too high"
    else
      echo "You got it! Have a milkdud!"
      break
    fi
done
