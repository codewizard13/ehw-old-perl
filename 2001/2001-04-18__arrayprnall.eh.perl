#!/usr/bin/perl
# File arrayprnall.eh.perl created by Eric Hepperle at 15:06:07 on Thu Apr 19 2001. 
#
# Calculates length of array so that it can print all
# elements in the array.
#



@array = (14, "cheeseburger", 1.23, -7, "toad");

$count = 1;

while ($count <= @array) {

   print ("element $count; $array[$count - 1]\n");

   $count++;

}
