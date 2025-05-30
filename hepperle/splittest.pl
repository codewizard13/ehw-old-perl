#!/usr/bin/perl
#
#
# Program:	splittest.pl
# Creator:	Eric Hepperle
# Date:	11/08/01
#
# Purpose:	simple program to demonstrate the split function of perl.
#
###################################################
#
# Revisions:
#
#	- Original:  11/08/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "This program is called splittest.pl\n\n";

$info = "Caine:Michael:Actor:14, Leafy Drive";
@personal = split(/:/, $info);

foreach $line (@personal) {

   print $line, "\n";

}

print "\n";
