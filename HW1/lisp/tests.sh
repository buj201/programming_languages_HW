#!/bin/bash

numtests=$(ls -1 ./tests | wc -l)
filenums=$(seq 1 $numtests)

expected=(8 8 42 11)

echo 'My tests:'
for i in $filenums;
do
  val=$(cat ./tests/test$i | ./a.out)
  echo "Returned value: $val, Expected value: ${expected[$i-1]}"
done

echo 'Provided tests:'
echo 'Valid tests:'
VALID=./../sample_input/lisp/valid/*
for f in $VALID;
do
  val=$(cat $f | ./a.out)
  echo "Returned value: $val, Expected value: $(echo $f | grep -Eo '[0-9]{1,}')"
done

INVALID=./../sample_input/lisp/invalid/*
echo 'Invalid tests:'
for f in $INVALID;
do
  echo $f
  val=$(cat $f | ./a.out)
done



