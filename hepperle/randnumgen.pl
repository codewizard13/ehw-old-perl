#!/usr/bin/perl
#
# Program:	randnumgen.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Generates 10 random numbers.
#
################################################


# collect the random number

$count = 1;

while ($count <= 100) {

   $randnum = int( rand(10) ) + 1;

   $randtotal[$randnum] += 1;

   $count++;

}

# print the total of each number

$count = 1;

print("Total for each number:\n");

while ($count <= 10) {

   print("\tnumber $count: $randtotal[$count]\n");

   $count++;

}
