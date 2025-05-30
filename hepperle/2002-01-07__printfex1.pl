#!/usr/bin/perl
#
# Program:	printfex1.pl
# Creator:	Eric Hepperle
# Date:		09/26/01
#
# Purpose:	Not my script.  Demonstrates the printf command and formatting text.
#
###############################################

print "Content-type: text/html\n\n";
$name = "Selena Sol";
$age = 28;
printf ("My name is %12.10s and my age is %d.\n", $name, $age);
