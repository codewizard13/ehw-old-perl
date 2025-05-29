#!/usr/bin/perl
#
#
# Program:	matchbetweenstartnend_perlfaq6.pl
# Creator:	Eric Hepperle
# Date:	12/27/01
#
# Purpose:	Is unadulterated example from the Perl FAQ 6, found under : Here's code that finds everything between START and END in a paragraph: 
#
###################################################
#
# Revisions:
#
#	- Original:  12/27/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called matchbetweenstartnend_perlfaq6.pl\n\n";


$in = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/startendtestfile.ez";


open(IN, "< $in")         or die "can't open $in: $!";

$count = 1;


#-----------------------------------------#

undef $/;           # read in whole file, not just one line or paragraph
         while ( <> ) {
              while ( /START(.*?)END/sm ) { # /s makes . cross line boundaries
                  print "$1\n";
                  $result = $1;
                 
              }
         }  

