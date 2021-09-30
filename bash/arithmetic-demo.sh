#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

prompt="Enter 3 numbers: "
read -p "$prompt" firstnum secondnum thirdnum

sum=$((firstnum + secondnum + thirdnum))
product=$((firstnum * secondnum * thirdnum))

cat <<EOF
The sum of $firstnum, $secondnum, and $thirdnum is $sum
The product of $firstnum, $secondnum, and $thirdnum is $product
EOF
