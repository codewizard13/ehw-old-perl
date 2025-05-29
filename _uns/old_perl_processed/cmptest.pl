#!/usr/bin/perl
#
#
# Program:	cmptest.pl
# Creator:	Eric Hepperle
# Date:		01/23/02
#
# Purpose:	Demonstrates using perl's cmp command for one of it's most popular uses: sorting.
#
###################################################
#
# Revisions:
#
#	- Original:  01/23/02
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
print "This program is called cmptest.pl\n\n";

# define text array test variable:
@array = (blue, yellow, orange, aqua, turquoise, cinnamon);

# define number array test variable:
@numarray = (2, 0, 000, 3, 4.5, 4.51, 3.14, 'avagadros number', 1.1414, 50000, 54546, 827349872, x45, f7, null, -4000, -400, -184.25, '7.813 e18');

# sort alphabetically ascending:
print "ALPHABETICALLY ASCENDING:\n";
print "==================================================\n\n";
@sorted = sort { $a cmp $b } @array;
foreach $el (@sorted) {
   print "ELEMENT:\t $el\n\n";
}
print "\n";


# Get a list of hash keys sorted by value.
print "LIST HASH KEYS SORTED BY VALUE:\n";
print "==================================================\n\n";
@sorted = sort { $hash{$a} cmp $hash{$b} } keys %ENV;
foreach $el (@sorted) {
   print "ELEMENT:\t $el\n\n";
}
print "\n";


# Numerical sort.
print "NUMERICAL SORT:\n";
print "==================================================\n\n";
@sorted = sort { $a <=> $b } @numarray;   # numerical sort
foreach $el (@sorted) {
   print "ELEMENT:\t $el\n\n";
}
print "\n";


# ASCII-betical sort.
print "ASCII-betical sort:\n";
print "==================================================\n\n";
@sorted = sort { $a cmp $b } @array;   # ASCII-betical sort
foreach $el (@sorted) {
   print "ELEMENT:\t $el\n\n";
}
print "\n";


# Reverse sort list.
print "REVERSE SORT:\n";
print "==================================================\n\n";
@sorted = reverse sort { $a cmp $b } @array;
foreach $el (@sorted) {
   print "ELEMENT:\t $el\n\n";
}
print "\n";
