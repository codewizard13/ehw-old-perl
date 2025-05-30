#!/usr/bin/perl
#
#
# Program:	passgen1.pl
# Creator:	Eric Hepperle
# Date:		12/31/01
#
# Purpose:	This should be my last script of 2001.  This is my first draft of a a password generating program. Currently it only does alpha permutations from aaa to zzz.  This does not include capitals, numerals, or symbols. Eventually it will cycle through all letters and number combinations.  Perhaps I can do it with an ascii and a formula?  Well, here we go...
#
###################################################
#
# Revisions:
#
#	- Original:  12/31/01
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
print "This program is called passgen1.pl\n\n";



foreach $let ('aaa'..'zzz') {
        print "$let\n";
}

