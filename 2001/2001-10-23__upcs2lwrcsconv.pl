#!/usr/bin/perl
# File upcs2lwrcsconv.pl created by Eric Hepperle at 15:17:38 on Wed Aug 29 2001. 
#
# Purpose:	Converts a line of text to all lowercase.

print "Enter some text.  When done, press <ENTER>\n";

while ($line = <STDIN>) {

   $line =~ tr/[A-Z]/[a-z]/;

   print ($line);

}
