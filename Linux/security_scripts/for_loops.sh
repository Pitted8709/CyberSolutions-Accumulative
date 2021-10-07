#!/bin/bash



# Create Variables
nums=$(echo {0..9})

states=("Colorado" "Ohio" "Alaska" "Georgia" "Wyoming" "New_York" "California")
ls_out=$(ls)
#suids=$(find / -type f -perm /4000 2> /dev/null)

#Create for Loops
#Create a loop that prints only 3 5 and 7

for nums in ${nums[@]};
do
 if [ $nums = 3 ] || [ $nums = 5 ] || [ $nums = 7 ]
 then
      echo $nums
  fi
 done

	#for [ Ohio ] in ${states[@]}

	#do
	#   if [ state=Ohio ]
	#then
	#     echo "Ohio is the best!"


#Create a loop that looks for 'New York'

for states in ${states[@]};
do
	if [ $states == 'New_York' ];
	then
	echo "New York is the best!"
	else
	echo "I'm not a fan of New York."
	fi
done

#Create a 'for' loop that prints out each item in your variable that holds
#the output of the 'ls' command.
for x in ${ls_out[@]};
do
	echo $x

done


#Bonus
#Create a for loop to print out suids on one line for each entry
#for suid in ${suids[@]};
#do
#	echo $suid
#done
