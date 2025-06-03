#!/usr/bin/perl
#
#
# Program:	countfiles.pl
# Creator:	Eric Hepperle
# Date:	12/20/01
#
# Purpose:	Simple script.  Uses foreach loop and calibration to count the number of files, folders, etc in a given folder.
#
###################################################
#
# Revisions:
#
#	- Original:  12/20/01
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
print "This program is called countfiles.pl\n\n";


@ls = `/bin/ls -lat`;

$count = 1;

foreach $line (@ls) {

   $count++;

}

$ttl = $count - 4;

print "\n\nThere are $ttl total entries in this folder (not including ., and ..).\n\n";
