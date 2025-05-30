#!/usr/bin/perl
#
#
# Program:        asciivalues.pl
# Creator:        Eric Hepperle
# Date:                01/21/02
#
# Purpose:        gives examples of syntax for printing ascii values.
#
###################################################
#
# Revisions:
#
#        - Original:  01/21/02
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
print "This program is called asciivalues.pl\n\n";


print "A backslash: \134\n";
print "Tab follows:\11over here\n";
print "Ring! \7\n";
print "Please pay bkuhn\100ebb.org \04420.\n";

print "\n\n";

# NOTE:        This didn't work so I am trying something different.
#
#for $count (020..176) {
#$asciival = \'$count';
#print "ASCII VALUE:\t", \\$count , "\n";
#print "ASCII VALUE: for $count = $asciival\n";
#print "ASCII VALUE: for $count = \\$count\n";
#$a = "\134"."$count";
#print "ASCII VALUE: for $count = $a\n";
#}
#print "\n\n";


#----------------------------------------------------


# PACK ! -- THE MAGIC WORD! -->

for $x (000..400) {

#   $foo = pack("cccc",$x,66,67,68);
# how to create words.

   $ascii_char = pack("c", $x);

   print "$x:\t\$ascii_char = $ascii_char\n";

}