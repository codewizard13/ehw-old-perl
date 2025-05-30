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



# The period has a special meaning in the split command:
# it tells split to match everything.
# To match periods (.) you must use "\.".
#
$volume = "lde.f.iop.52f020sl.g.3";

@volary = split(/\./, $volume);

$cnt = 1;

foreach $element (@volary) {

   print "element $cnt =	$element\n\n";

   $cnt++;

}
