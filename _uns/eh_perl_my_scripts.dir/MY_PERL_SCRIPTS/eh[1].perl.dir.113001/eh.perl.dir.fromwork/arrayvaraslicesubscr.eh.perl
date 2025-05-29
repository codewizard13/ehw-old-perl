#!/usr/bin/perl
# File arrayvaraslicesubscr.eh.perl created by Eric Hepperle at 15:30:58 on Thu Apr 19 2001.
#
# Demonstrates array range used as subscript.
#




@array = ("one", "two", "three", "four", "five");

@range = (1, 2, 3);

@subarray = @array[@range];

print ("The array slice is: @subarray\n");




