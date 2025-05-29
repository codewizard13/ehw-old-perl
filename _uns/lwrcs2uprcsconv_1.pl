#!/usr/bin/perl
# File lwrcs2uprcsconv.pl created by Eric Hepperle at 15:26:10 on Wed Aug 29 2001. 
#
# Not my script.  Simple lowercase to all upper-case conversion script.

print "Enter some text.  When done, press <ctrl-d>\n";

while ($line = <STDIN>) {

   $line =~ tr/[a-z]/[A-Z]/;

   print ($line);

}
