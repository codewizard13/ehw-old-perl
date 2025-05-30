#!/usr/bin/perl
#
# Program:	eh_waystoconcat.pl
# Creator:	Eric Hepperle
# Date:		06/29/01
#
# Purpose:	This file demonstrates various ways to concatenate files in perl.
#
#####################################################3


print "\n";
print "enter a variable:  ";
$var1 = <STDIN>;
chomp $var1;
print "\n";

print "enter a second variable:  ";
$var2 = <STDIN>;
chomp $var2;
print "\n";

$catres = "$var1$var2";



print "The conacatenated result is: $catres \n\n";

print "The second version from using the \\ form is:\n\n";
print "$var1\$var2\n\n";
