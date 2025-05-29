#!/usr/bin/perl
#
#
# Program:	ping_test.pl
# Creator:	Eric Hepperle
# Date:	02/08/02
#
# Purpose:	Demonstrates the Net_Ping module.
#
###################################################
#
# Revisions:
#
#	- Original:  02/08/02
#
#	!!! WORKS, but only tests if a host is reachable
#		doesn't display pingtime info, etc.
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
print "This program is called ping_test.pl\n\n";


$host = "doomsday.rchland.ibm.com";

use Net::Ping;

 $p = Net::Ping->new() or die "Can't create new ping object: $!\n";

 print "$host is alive" if $p->ping($host);

 $p->close;

 #-----------------------------
 # use TCP if we're not root, ICMP if we are

 $pong = Net::Ping->new( $> ? "tcp" : "icmp" );

 (defined $pong)
     or die "Couldn't create Net::Ping object: $!\n";

 if ($pong->ping("www.thescreensavers.com")) {

     print "The giant ape lives!\n";

 } else {

     print "All hail mighty Gamera, friend of children!\n";

 }
 #-----------------------------
