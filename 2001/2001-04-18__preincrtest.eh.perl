#!/usr/bin/perl
# File preincrtest.eh.perl created by Eric Hepperle at 12:40:21 on Thu Apr 19 2001. 
#
# This little piece of code starts at a value + 1, (in this case: 0),
# and increments by adding one until value is greater than 5.
#

$value = 0;

while (++$value <= 5) {

   print("value is now $value\n");

}

print("all done\n");
