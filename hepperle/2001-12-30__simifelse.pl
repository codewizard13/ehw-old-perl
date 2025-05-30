#!/usr/local/bin/perl
#
# Program:	simifelse.pl
# Creator:	Eric Hepperle
# Date:		10/22/01
#
# Purpose:	User enters two numbers and it gives msg if they are equal, and different msg if they are not.
#
########################################


print ("Enter a number:\n");

$number1 = <STDIN>;

chop ($number1);

print ("Enter another number:\n");

$number2 = <STDIN>;

chop ($number2);

if ($number1 == $number2) {

	print ("The two numbers are equal.\n");

} else {

	print ("The two numbers are not equal.\n");

}

print ("This is the last line of the program.\n");
