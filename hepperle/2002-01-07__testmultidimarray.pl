#!/usr/bin/perl
#
# Program:	testmultidimarray.pl
# Creator:	Eric Hepperle
# Date:		06/08/01
#
# Purpose:	Not my script.  Uses multi-dimensional arrays and nested foreach loops to display boolean truth tables.
#
#####################################################

my @array;

$array[0][0] = "|0|0|";
$array[0][1] = "|0|1|";
$array[0][2] = "|0|2|";
$array[1][0] = "|1|0|";
$array[1][1] = "|1|1|";

print "Method 1:\n";

print "$array[0][0]\n";
print "$array[0][1]\n";
print "$array[0][2]\n";
print "$array[1][0]\n";
print "$array[1][1]\n";

print "\nMethod 2:\n";

foreach my $arrayref ( @array ) {

    foreach ( @{$arrayref} ) {

        print "$_\n";

    }

}
