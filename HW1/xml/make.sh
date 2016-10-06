#!/bin/sh

if [ ! -f $1.y -o ! -f $1.l ] ; then
  echo No target.
  exit
fi

echo "Deleting old .h, .c, and .output files...\n"
rm lex.yy.c $1.tab.h $1.tab.c a.out

echo "Running flex/bison...\n"
bison -d $1.y
flex $1.l
g++ lex.yy.c $1.tab.c

