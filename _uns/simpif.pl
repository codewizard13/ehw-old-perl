#!/usr/bin/perl
#
# Program:	simpif.pl
# Creator:	Eric Hepperle
# Date:		10/24/01
#
# Purpose:	Demonstrates using if to compare numbers.
#
######################################################

print ("Enter a number:\n");

$number = <STDIN>;

chop ($number);

if ($number) {

	print ("The number is not zero.\n");

}

print ("This is the last line of the program.\n");
