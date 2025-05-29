#!/usr/bin/perl
#
#
# Program:	whois_test.pl
# Creator:	Eric Hepperle
# Date:	02/08/02
#
# Purpose:	Demonstrates the Net_Whois module.
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
print "This program is called whois_test.pl\n\n";


# from:
#
# http://pleac.sourceforge.net/pleac_perl/internetservices.html
#
#

use Net::Whois;

 $domain_obj = Net::Whois::Domain->new($domain_name)
     or die "Couldn't get information on $domain_name: $!\n";

 # call methods on $domain_obj to get name, tag, address, etc.
 #-----------------------------
 $d = Net::Whois::Domain->new( "www.thescreensavers.com" )
     or die "Can't get information on the screensavers\n";
 #-----------------------------
 print "The domain is called ", $d->domain, "\n";
 print "Its tag is ", $d->tag, "\n";
 #-----------------------------
 print "Mail for ", $d->name, " should be sent to:\n";
 print map { "\t$_\n" } $d->address;
 print "\t", $d->country, "\n";
 #-----------------------------

 $contact_hash = $d->contacts;

 if ($contact_hash) {

     print "Contacts:\n";

     foreach $type (sort keys %$contact_hash) {

         print "  $type:\n";

         foreach $line (@{$contact_hash->{$type}}) {

             print "    $line\n";

         }

     }

 } else {

     print "No contact information.\n";

 }
 #-----------------------------
