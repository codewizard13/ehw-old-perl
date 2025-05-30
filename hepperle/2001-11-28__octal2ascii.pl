#!/usr/bin/perl
#
#
# Program:	octal2ascii.pl
# Creator:	Eric Hepperle
# Date:		11/27/01
#
# Purpose:	To create a table for converting octal to ascii.
#
###################################################
#
# Revisions:
#
#	- Original:  11/27/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n";
print "This program is called octal2ascii.pl";
print "\n";

print "OCTAL		ASCII\n";
print "=======================\n";
print "\n";



for $count (000..177) {

   $octcount = `\$count`;

   print "$count\t\t\t \\$count\n";
}


print "'$count'\n";
