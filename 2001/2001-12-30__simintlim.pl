#!/usr/bin/perl
#
# Program:	simintlim.pl
# Creator:	Eric Hepperle
# Date:		10/23/01
#
# Purpose:	Demonstrates how perl automatically converts large numbers to scientific notation.
#
###########################################################

$value = 1234567890;

print ("first value is ", $value, "\n");

$value = 1234567890123456;

print ("second value is ", $value, "\n");

$value = 1234578901234567890;

print ("third value is ", $value, "\n");


