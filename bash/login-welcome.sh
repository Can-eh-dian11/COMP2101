#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
date=$(date +%A)

#Determine what title to use based on the current date
title="Tech Monkey"
test $date = "Tuesday" && title="Computer Whisperer"
test $date = "Wednesday" && title="Tech Wizard"
test $date = "Thursday" && title="Hacker"
test $date = "Friday" && title="Professional Rebooter"
test $date = "Saturday" && title="PC Overlord"
test $date = "Sunday" && title="King of Signals"

#Store the output in a variable
output="It is $date at $(date +%T). Welcome to planet $(hostname), '$title $USER!'"
cowsay $output
