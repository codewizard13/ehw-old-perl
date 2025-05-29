#!/usr/bin/perl
#
#
# Program:	killallnetscapes.pl
# Creator:	Eric Hepperle
# Date:	01/09/02
#
# Purpose:	Gets all process id's for netscape and then kills them all one by one.  Alleviates an individual having to cut and paste each process number by hand.
#
###################################################
#
# Revisions:
#
#	- Original:  01/09/02
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
print "This program is called killallnetscapes.pl\n\n";

@results = `ps -ef | grep netscape`;

foreach $line (@results) {

   chomp $line;

   @spline = split (/\s+/, $line);
   print "LINE: $line\n\n";

   foreach $el (@spline) {
      print "ELEMENT:\t$el\n";
   }

   $pid = @spline[1];

   `kill -TERM $pid`;
   print "JUST KILLED process id: [$pid].\n\n";
}
