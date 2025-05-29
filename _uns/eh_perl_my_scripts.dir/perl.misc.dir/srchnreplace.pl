#!/usr/bin/perl
#
# Program:	srchnreplace.pl
# Creator:	Eric Hepperle
# Date:		04/24/01
#
# Purpose:	Not my script.  Will replace any number of words with another word at every instance.
######################################################
#
# Author:	William J Daskaluk <redmage@bestnet.org>
#
#  Syntax: replace <string1> [string2] [stringN] <newstring>
# Example: cat filename | replace teh hte the > filename2
#
# Warning: cat filename | replace teh hte the > filename will destroy filename
#
######################################################

 $ARGC = -1;

 foreach(@ARGV) { $ARGC = $ARGC + 1; }

 while ($out = <STDIN>) {

   foreach(@ARGV) {

     if ($_ ne @ARGV[$ARGC]) {

       while(index ($out, $_) >= 0) {

         $out =~ s/$_/@ARGV[$ARGC]/;

       }

     }

   }

   print $out;

 }

 
