#!/bin/sh

### BEGIN CUSTOM BLOCK ###

gid=5000 # default group
csvfile=users.csv # user csv file
pwlist=ipa-create-users-passwords.txt # file with initial random passwords

### END ###

while IFS=, read first last login email
do
    echo "* Creating user $login"
    
    ipa user-add --first $first --last $last --email $email --random \
     --gidnumber $gid $login | \
     grep -e "User login" -e "Random password" >> $pwlist
    
    echo "--" >> $pwlist
done < $csvfile

echo -e "Passwords are stored in file $pwlist. \n"



