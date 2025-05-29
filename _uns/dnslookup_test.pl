#!/usr/bin/perl
#
#
# Program:	dnslookup_test.pl
# Creator:	Eric Hepperle
# Date:	02/08/02
#
# Purpose:	Demonstrates dns lookup using the perl Socket module.
#
###################################################
#
# Revisions:
#
#	- Original:  02/08/02
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
print "This program is called dnslookup_test.pl\n\n";

use Socket;

@addresses = gethostbyname($name) or die "Can't resolve $name: $!\n";
@addresses = map { inet_ntoa($_) } @addresses[4 .. $#addresses];
