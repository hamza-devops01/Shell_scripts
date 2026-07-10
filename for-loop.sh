#!/bin/bash

# This is for and while loop

#for loop

<<simple
for (( num=1; num<5; num++ ))
do
	mkdir "demo$num"
done
simple

<< task
1 is argument which is  the folder name
2 is start range
3 is end range


for (( i=$2; i<=$3; i++ ))
do
        mkdir "$1$i"
done
task

# While loop

<<while
count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))  # count ko 1 se badhao
    #count=$count+1
done

while

#if-else-if

#marks=75
read -p"Enter Numbers:" marks
if [ $marks -ge 90 ];
then
	echo "Grade A+ (Excellent)"
elif [ $marks -ge 80 ];
then
	echo "Grade A (Very Good)"
elif [ $marks -ge 70 ];
then
	echo " Grade B (Good)"
elif [ $marks -ge 60 ];
then
	echo "Grade C (Average)"
elif [ $marks -ge 50 ];
then
	echo "Grade D (Pass)"
else
	echo "Fail"
fi


