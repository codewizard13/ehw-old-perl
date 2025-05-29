#!/usr/bin/perl -w
#
# Program:	ehgeturlsrc.pl
# Creator:	Eric Hepperle
# Date:		06/04/01
#
# Purpose:	This program will rip the source code of any
#		url.
#
#########################################

print "\n";

use LWP::Simple;

use File::Basename;
    my $progname = basename($0);

print "\n";
print "The name of this file is $progname \n";
print "\n";

print "\n";
print "The full path to this file is: \n";
print "$0 \n";

#----------

print "\n";

print "This program gets the source code of any url entered. \n";
print "\n";

print "Enter a url to retrieve: ";
$url = <STDIN>;

print "\n";

$file = get ("$url");

print "The source code of the url $url is: \n";
print "====================================\n";
print "$file \n";



#----------
$hold = <STDIN>;