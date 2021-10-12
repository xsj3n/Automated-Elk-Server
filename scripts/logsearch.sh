
#/bin/bash
# 1 = filename
# 2 = Name
# 3 = time
# Syntax = ./<filename> <name> <fileforsearch> <time> <am/pm>

NAME=$1
FILE=$2
TIME=$3
AM/PM=$4
grep $1 $2 | grep $3 | grep $4 
