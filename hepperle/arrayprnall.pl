#!/usr/bin/perl
#
# Program:        arrayprnall.pl
# Creator:        Eric Hepperle
# Date:                04/19/01
#
# Purpose:        Calculates length of array so that it can print all elements in the array.
#
######################################################



@array = (14, "cheeseburger", 1.23, -7, "toad");

$count = 1;

while ($count <= @array) {

   print ("element $count; $array[$count - 1]\n");

   $count++;

}

$arrayLength = ($#array + 1);
print "\@array length =\t$arrayLength\n";