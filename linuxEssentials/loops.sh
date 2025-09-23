#!/bin/bash



for NAME in Sean Jon Isaac David; do
  echo "Hello $NAME"
done

for S in *; do
  echo "Doing something to $S"
done

i=0
while [ $i -lt 40 ]; do
echo $i
  i=$(( $i + 2))
done
echo "Done counting"




