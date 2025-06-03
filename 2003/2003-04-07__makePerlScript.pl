#!/usr/bin/perl
#
# Program:     makePerlScript.pl
# Creator:     Eric Hepperle
# Date:        04/07/03
#
# Purpose:     Creates standardized perl
#              programs using user-
#              specified values.
#
#----------------------------------------

# define default directory
$defaultDir = "c:/Documents and Settings/Nunya_beezniss/desktop";

# let user enter program name
print "Program:\t";
chomp $program;
print "\n";

# let user enter creator name
print "Creator:\t";
chomp $creator;
print "\n";

# press any key to continue
$hold = <STDIN>;
