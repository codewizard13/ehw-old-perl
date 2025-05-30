#!/usr/bin/perl
#
# Program:	uncataloged_suckurl1.pl
# Creator:	Eric Hepperle
# Date:		10/05/01
#
# Purpose:	Not my script.  Code snippet that demonstrates a regex for sucking urls.  Doesn't work yet.   Taken from:
#
# http://www.peak.org/~regan/perl/
#
####################################################


print "\n\n";


$line = "Microsoft® Internet Explorer version 6.0: http://www.microsoft.com/insider/internet/articles/security2.htm#viruses";



$line =~ s#.*(http://.*)\s.*#\1#i;	# This is the only line I borrowed.



$result = $1;

print "Here is the matched string:\n\n";
print "$result\n\n";
