#!/bin/sh

### BEGIN CUSTOM BLOCK ###

gid=5000 # default group
csvfile=users.csv # user csv file
pwlist=ipa-create-users-passwords.txt # file with initial random passwords

### END ###

# check if tgt and csv files are available
if ( ! klist -s ); then
	echo -e "No TGT available. Run kinit and try again.\n"
	exit 1
fi

if [ ! -f $csvfile ]; then
	echo -e "No CSV file available. Exiting.\n"
	exit 1
fi

# Create the users   
while IFS=, read first last login email
do
    echo "* Creating user $login"
    
    ipa user-add --first $first --last $last --email $email --random \
     --gidnumber $gid $login | \
     grep -e "User login" -e "Random password" >> $pwlist
    
    echo "--" >> $pwlist
done < $csvfile

if [ -f $pwlist ]; then
    echo -e "Passwords are stored in file $pwlist. \n"
fi


