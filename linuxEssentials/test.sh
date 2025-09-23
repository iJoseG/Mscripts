#!/bin/bash

echo "hello, World!"
echo -n "the time is $(date)"

ANIMAL="PINWINOOO"
echo " \n Mi animal favorito es $ANIMAL"

echo " "

CURRENT_DIRECTORY=`pwd`
echo "You are in $CURRENT_DIRECTORY"

echo " "

echo -n "What is your name? "
read NAME
echo "Hello $NAME!"

echo " "

echo "Hello $0"

echo " "

echo "$?"

echo " "

case "$1" in
hello|hi)
  echo "hello yourself"
  ;;
goodbye)
  echo "nice to have met you"
  echo "I hope to see you again"
  ;;
*)
  echo "I didn't understand that"
esac



