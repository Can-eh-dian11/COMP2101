#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

#Ensure that the script is run as root to avoid errors with sed and hostnamectl
test "`whoami`" = "root" || { echo "Script needs to be run as root"; exit 1; }

# Get the current hostname using the hostname command and save it in a variable
currenthostname=$(hostname)

# Tell the user what the current hostname is in a human friendly way
echo "The current hostname is: $currenthostname"

# Ask for the user's student number using the read command
read -p "Please enter your student number: " studentnumber

# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user
newhostname="pc$studentnumber"

# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts
test $(cat /etc/hosts | grep $currenthostname | awk '{print $2}') = $currenthostname && { sed -i "s/$currenthostname/$newhostname/" /etc/hosts; echo "Updated hostname in /etc/hosts to $newhostname"; }

# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname
test $currenthostname = $newhostname || hostnamectl set-hostname $newhostname
echo "The hostname has been changed to $newhostname. You should reboot now for the changes to take full effect."
