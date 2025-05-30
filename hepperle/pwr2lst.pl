#!/usr/local/bin/perl
#
# Program:	pwr2lst.pl
# Creator:	Eric Hepperle
# Date:		02/28/01
#
# Purpose:	Simple exponent operator demonstration.  Asks for a number, n, and prints 2 to the exponent n.
#
#########################################################

print ("Enter the exponent to use:\n");
$exponent = <STDIN>;
chop ($exponent);

print ("Two to the power $exponent is ", 2 ** $exponent, "\n");

