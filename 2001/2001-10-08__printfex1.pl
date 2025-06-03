#!/usr/bin/perl
# File printfex1.pl created by Eric Hepperle at 13:26:18 on Wed Sep 26 2001.
#
# Not my script.  Demonstrates the printf command and formatting text.

print "Content-type: text/html\n\n";
$name = "Selena Sol";
$age = 28;
printf ("My name is %12.10s and my age is %d.\n", $name, $age);
