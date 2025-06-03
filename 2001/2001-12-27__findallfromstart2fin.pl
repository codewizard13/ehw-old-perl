#!/usr/bin/perl
#
#
# Program:	findallfromstart2fin.pl
# Creator:	Eric Hepperle
# Date:	12/27/01
#
# Purpose:	Demonstrates using regular expressions to search a file for all text between a string $start, and $end.
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
print "This program is called findallfromstart2fin.pl\n\n";

$in = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/startendtestfile.ez";

undef $/;           # read in whole file, not just one line or paragraph

open(IN, "< $in")         or die "can't open $in: $!";

   # store contents of $in in a scalar string var.
   $file = <IN>;

    # Tracing
    # print "file = $file\n";

   # Match between "START" and "END".
   if ($file =~ /START(.*?)END/sm) {

      $result = $1;

   }

  print $result;


close (IN);
