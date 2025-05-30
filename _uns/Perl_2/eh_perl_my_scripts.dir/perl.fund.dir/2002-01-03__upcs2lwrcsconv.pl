#!/usr/bin/perl
#
# Program:	upcs2lwrcsconv.pl
# Creator:	Eric Hepperle
# Date:		08/29/01
#
# Purpose:	Converts a line of text to all lowercase.
#
###############################################


print "Enter some text.  When done, press <ENTER>\n";

while ($line = <STDIN>) {

   $line =~ tr/[A-Z]/[a-z]/;

   print ($line);

}
