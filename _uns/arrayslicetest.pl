#!/usr/bin/perl
#
# Program:	arrayslicetest.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Demonstrates usage of array slice.
#
#####################################################


@array = (1, 2, 3, 4);

@subarray = @array[1, 2];

print ("The first element of subarray is $subarray[0]\n");

print ("The second element of subarray is $subarray[1]\n");


