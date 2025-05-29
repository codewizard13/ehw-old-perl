#!/usr/bin/perl
#
#
# Program:	putcommasinnumbers.pl
# Creator:	Eric Hepperle
# Date:		01/31/02
#
# Purpose:	Taken from Perl Cookbook, p. 64.  Prints numbers with commas after every third digit.
#
###################################################
#
# Revisions:
#
#	- Original:  01/31/02
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
print "This program is called putcommasinnumbers.pl\n\n";

$num = 240000293478327.97856011014;

print "ORIGINAL NUM:\t $num\n\n";
$out = &commify($num);
print commify($num);
print "NUM W/ COMMA:\t $out\n\n";





sub commify {

   my $text = reverse $_[0];

   $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;

   return scalar reverse $text;

}
