#!/usr/local/bin/perl
#
# Program:	simcomp.pl
# Creator:	Eric Hepperle
# Date:		10/22/01
#
# Purpose:	Takes two numbers the user inputs, and compares them
#		with an if statement.  If the numbers are equal, it
#		tells the user so; otherwise, there is no response.
#
######################################################


print ("Enter a number:\n");

$number1 = <STDIN>;

chop ($number1);

print ("Enter another number:\n");

$number2 = <STDIN>;

chop ($number2);

if ($number1 == $number2) {

	print ("The two numbers are equal.\n");

}

print ("This is the last line of the program.\n");

