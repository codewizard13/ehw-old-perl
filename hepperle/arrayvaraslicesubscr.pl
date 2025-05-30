#!/usr/bin/perl
#
# Program:	arrayvaraslicesubscr.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Demonstrates array range used as subscript.
#
################################################




@array = ("one", "two", "three", "four", "five");

@range = (1, 2, 3);

@subarray = @array[@range];

print ("The array slice is: @subarray\n");




