#!/usr/bin/perl
#
# Program:	preincrtest.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	This little piece of code starts at a value + 1, (in this case: 0),
# and increments by adding one until value is greater than 5.
#
#####################################################

$value = 0;

while (++$value <= 5) {

   print("value is now $value\n");

}

print("all done\n");
