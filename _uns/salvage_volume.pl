#!/usr/bin/perl
#
#
# Program:	salvage_volume.pl
# Creator:	Eric Hepperle
# Date:	01/02/02
#
# Purpose:	Automates the steps involved in salvaging a volume.  Not finished
#
###################################################
#
# Revisions:
#
#	- Original:  01/02/02
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
print "This program is called salvage_volume.pl\n\n";


print "Enter a path or server name:\n";
$ans = <STDIN>;
chomp $ans;

print "\n";

$check1 = $ans;

$check1 =~ s/.*\///g;

$chk1_res = $1;

print "check1 value =\t$chk1_res\n\n";

if ($ans =~ /^\//) {

   # Tracing:
   print "You entered a path!\n\n";

   $is = "path";

} elsif ($ans =~ /*.*.*/




















# unless server, partition, and volume are a value other than
# null or blanks, then ...
#
unless ($server && $part && $vol) {

   print "One or all of these elements are blank or null:\n";
   print "\t* server\n\t* partiton\n\t* volume\n\n";

}

