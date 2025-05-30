#!/usr/bin/perl
#
#
# Program:	getprogdescr_v2.pl
# Creator:	Eric Hepperle
# Date:		12/27/01
#
# Purpose:	Reads one of my perl files and prints out the description text.
#		(3rd try)
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
#
#	EUREEKA !!!!! - 12/28/01

#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called getprogdescr_v3.pl\n\n";

print "Enter a filename to get description from: \n";
$file = <STDIN>;
chomp $file;


if ($file ne "") {

   $in = $file;

} else {

   $in = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir/startendtestfile.ez";

}


print "Enter a start string, (default = Purpose): ";
$start = <STDIN>;
chomp $start;

if ($start eq "") {

   $start = "Purpose:";

}


print "Enter an end string, (default = ##########): ";
$end = <STDIN>;
chomp $end;

if ($end eq "") {

   $end = "##########";

}


undef $/;           # read in whole file, not just one line or paragraph

open(IN, "< $in")         or die "can't open $in: $!";

   # store contents of $in in a scalar string var.
   $file = <IN>;

#   print "file = $file\n";

   # Match between "Purpose" and "#######".
   if ($file =~ /$start(.*?)$end/sm) {

      $result = $1;

   }

  print "\n\n";
  print "Description:\n\n";
  print $result;
  print "\n";

close (IN);


