#!/usr/bin/perl
#
# Program:	testhash.pl
# Creator:	Eric Hepperle
# Date:		06/07/01
#
# Purpose:	Simple hash example.  Allows one to select one item from a 2 dimensional array.
#
###################################################


#print "Enter the code you want to retrieve\n";


$key = 101;


%hash1;

$hash1{100} = "This is some text";
$hash1{101} = "some more texts";
$hash1{105} = "even more!";

if ($hash1{$key})
{
    print $key = $hash1{$key} . "\n";
}
