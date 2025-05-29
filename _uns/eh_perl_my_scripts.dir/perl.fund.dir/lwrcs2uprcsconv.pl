#!/usr/bin/perl
#
# Program:	lwrcs2uprcsconv.pl
# Creator:	Eric Hepperle
# Date:		08/29/01
#
# Purpose:	Not my script.  Simple lowercase to all upper-case conversion script.
#
#######################################################


print "Enter some text.  When done, press <ctrl-d>\n";

while ($line = <STDIN>) {

   $line =~ tr/[a-z]/[A-Z]/;

   print ($line);

}
