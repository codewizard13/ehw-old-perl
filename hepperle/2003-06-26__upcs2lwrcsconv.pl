#!/usr/bin/perl
#
# Program:        upcs2lwrcsconv.pl
# Creator:        Eric Hepperle
# Date:                08/29/01
#
# Purpose:        Converts a line of text to all lowercase.
#
###############################################


print "Enter some text.  When done, press <ENTER>\n";

while ($line = <STDIN>) {

#   $line = "ALPHABETICALLY ASCENDING, LIST HASH KEYS SORTED BY VALUE, NUMERICAL SORT, ASCII-betical sort, REVERSE SORT, array sorting";

   $line =~ tr/[A-Z]/[a-z]/;



   print ($line);

}


$hold = <STDIN>;
