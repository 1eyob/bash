#!/bin/bash
file=~/Desktop/ff1.sh

if [ -e $file ]
then echo "The file exists"
{ sudo chown eyobed:eyobed $file; } && { echo "The file is now permissioned to user eyobed"; }

elif [ ! -e $file ]
then echo "The file does NOT exist"

fi




