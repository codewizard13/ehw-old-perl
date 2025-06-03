#!/usr/bin/perl
#
#
# Program:	permut_0to9_2dig.pl
# Creator:	Eric Hepperle
# Date:		01/22/02
#
# Purpose:	Simple demonstration of using the pack command to develop all possibilities acchievable for this two digit combination.
#
###################################################
#
# Revisions:
#
#	- Original:  01/22/02
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
print "This program is called permut_0to9_2dig.pl\n\n";


# CONVENTION:
# dp1 = decimal position 1.

# initialize a count value so we can guage where we are at
$count = 0;

# tefine temp file.
$outfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/2digpermutations.ez";


# open out file for writing.
open (OUT, ">$outfile");

# set range value:
$range = "48..57";

for $dp1 (48..57) {

   for $dp2 (48..57) {

      $word = pack("cc", $dp1, $dp2);

      print "word\t $count\n";

      # write this string to the file
      print OUT "$word\n";

      # increment count var by 1.
      $count++;

      # @wrdary_a = (@wrdary_a, $word);

      # Tracing:
      #print "$word\n";

    }

}


close (OUT);
