#!/usr/bin/perl
#
#
# Program:	permut_all4digoptions.pl
# Creator:	Eric Hepperle
# Date:		01/21/02
#
# Purpose:	Produced every ascii 4 digit option from ascii(32 to 126), and writes them to a file..  There should be c. about 95^4 possibilities (81,450,625 combiniations).  Uses pack.
#
###################################################
#
# Revisions:
#
#	- Original:  01/21/02
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
print "This program is called permut_all4digoptions.pl\n\n";

# CONVENTION:
# dp1 = decimal position 1.

# initialize a count value so we can guage where we are at
$count = 0;

# tefine temp file.
$outfile = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/4digpermutations.ez";



# open out file for writing.
open (OUT, ">$outfile");

for $dp1 (32..126) {

   for $dp2 (32..126) {

      for $dp3 (32..126) {

	 for $dp4 (32..126) {

            $word = pack("ccc", $dp1, $dp2, $dp3, $dp4);

            print "word\t $count\n";

	    # write this string to the file
            print OUT "$word\n";

	    # increment count var by 1.
            $count++;

#            @wrdary_a = (@wrdary_a, $word);

	    # Tracing:
            #print "$word\n";

	 }

      }

   }

} 


close (OUT);
