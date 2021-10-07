#!/usr/bin/env bash

# Check if running as root
if [ $UID = 0 ]
then
    echo "Please don't run this script as root, it's not good for you"
    exit
fi

# Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
full_perms=$(sudo find /home -type f -perm 777)
paths=(
     '/etc/passwd'
     '/etc/shadow'
)


#mkdir -p ~/research
if [ ! -d ~/research ]
then
    mkdir ~/research
fi

if [ -f $output ]
then
    rm $output
fi


#This sections serves to stamp the user/date/time & machine

echo -e "System audit script running on $(date)" >> $output

echo -e "\nUname information: $(uname)\n" >> $output

echo -e "\nIP Information: $ip \n" >> $output

echo -e "\nHostname: $HOSTNAME\n" >> $output

# Bonus Section: Detailing the freespace on disk and userinfo

echo -e "\nDNS Information: \n$(cat /etc/resolv.conf)\n" >> $output

echo -e "Memory information: \n$(free -h)\n" >> $output

echo -e "\nCPU Info: \n$(lscpu | grep CPU)" >> $output

echo -e "\nDisk Usage: \n$(df -H | head -2)" >> $output

echo -e "\nWho is currently logged in: \n $(who -a) \n" >> $output

echo -e "\n '777' files in the home directory: \n" >> $output

echo $full_perms >> $output 

echo -e "\nTop 10 Processes on $HOSTNAME: \n $(ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head -11)" >> $output

for paths in ${paths[@]};
do
	ls -la $paths >> $output

done

for user in ${ls/home};
do
	sudo -lU $user >> $output
done

