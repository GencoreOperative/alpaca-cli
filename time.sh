#!/bin/bash

# Define the command to time
COMMAND="./ask \"Write a 25 word paragraph about the Python programming language.\""

TIMES=times.txt
[ -f $TIMES ] && rm -f $TIMES

# Run the command in a loop and record the time in a file
for i in {1..5}; do
  START=$(date +%s.%N)
  eval $COMMAND
  END=$(date +%s.%N)
  ELAPSED=$(echo "scale=3; $END - $START" | bc)
  echo $ELAPSED >> $TIMES
done

# Calculate the average time from the recorded $TIMES
AVG=$(awk '{ total += $1; count++ } END { print total/count }' $TIMES)
echo "Average time: $AVG seconds"