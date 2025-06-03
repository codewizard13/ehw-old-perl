#!/usr/bin/perl
# File eh_waystoconcat.pl created by Eric Hepperle at 10:01:38 on Fri Jun 29 2001.
#
# This file demonstrates various ways to concatenate files
# in perl.


print "enter a variable:  ";
$var1 = <STDIN>;
chomp $var1;
print "\n";

print "enter a second variable:  ";
$var2 = <STDIN>;
chomp $var2;
print "\n";

$catres = "$var1$var2";



print "The conacatenated result is: $catres \n";

print "The second version from using the \\ form is:\n";
print "$var1\$var2";


$hold = <STDIN>;