#!/usr/bin/perl
#
#
# Program:	which_remote_installserver.pl
# Creator:	Eric Hepperle
# Date:	11/15/01
#
# Purpose:	Quickly searches the file install_servers.ez for an install server based on the location entered.
#
###################################################
#
# Revisions:
#
#	- Original:  11/15/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n";
print "This program is called which_remote_installserver.pl\n\n";

$location = $ARGV[0];

$serverlist = "/afs/rchland.ibm.com/usr3/v2cib484/install_servers.ez";

# Rich Wales said you can use this
system("/usr/bin/grep $location $serverlist ");

# Rich Wales advised this:
#@grep_output = `/usr/bin/grep $location $serverlist 2>&1`;
#print @grep_output;

print "\n\n";

