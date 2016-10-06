#!/bin/bash

numtests=$(ls -1 ./tests | wc -l)
filenums=$(seq 1 $numtests)

expected=("Valid" "Valid" "Invalid" "Valid")

echo -e 'My tests:\n'
for i in $filenums;
do
  val=$(cat ./tests/test$i.xml | ./a.out)
  echo -e "Returned value: $val\nExpected value: ${expected[$i-1]}\n"
done

echo -e 'Provided tests:\n'
echo -e 'Valid tests:\n'
VALID=./../sample_input/xml/valid/*
for f in $VALID;
do
  val=$(cat $f | ./a.out)
  echo -e "Returned value: $val\nExpected value: valid\n"
done

INVALID=./../sample_input/xml/invalid/*
echo -e 'Invalid tests:\n'
for f in $INVALID;
do
  val=$(cat $f | ./a.out)
  echo -e  "Returned value: $val\nExpected value: invalid\n"
done



