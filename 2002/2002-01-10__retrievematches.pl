#!/usr/bin/perl
#
#
# Program:	retrievematches.pl
# Creator:	Eric Hepperle
# Date:		12/27/01
#
# Purpose:	Demonstrates how to get matched result of a regular expression.  Also demonstrates PARSING URLS (which should be its own file).  Uses the "$1" variable as the default result of a matched string.  Requires file: /afs/rchland.ibm.com/usr3/v2cib484/.netscape/bookmarks.html.
#
#		derived from the following usenet post:
#
#		http://groups.google.com/groups?hl=en&selm=902862439.23601.0.nnrp-06.c2de775f%40news.demon.co.uk
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
print "This program is called retrievematches.pl\n\n";

open (INFILE,"/afs/rchland.ibm.com/usr3/v2cib484/.netscape/bookmarks.html");

# Choose one of the following lines
#while (chop($line = <DATA>)) {
while (chop($line = <INFILE>)) {

$line =~ m!\"http(s?)://(.+?)/(.*?)\"!;
print "Secure\t" if $1;
print "Site: $2\t" if $2;
print "Page: $3" if $3;
print "\n";
}

