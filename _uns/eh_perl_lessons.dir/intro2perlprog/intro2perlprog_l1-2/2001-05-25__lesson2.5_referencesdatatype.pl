#!/usr/bin/perl -w

print "\n";
# set up the data types
my $scalarVar = "Eric was here";

print "\n";
# create the reference to $scalarVar
# (the ref will be a number, like hex)
#
my $scalarRef = \$scalarVar;

print "$scalarVar\n";
print "$scalarRef\n";


$hold = <STDIN>;