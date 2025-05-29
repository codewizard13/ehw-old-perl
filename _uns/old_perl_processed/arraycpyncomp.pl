#!/usr/bin/perl
#
# Program:	arraycpyncomp.eh.perl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Copy the elements of one array to another and then compare
# the resulting array to check for any differences, (there
# should be none).
#
#########################################################


@array1 = (14, "cheeseburger", 1.23, -7, "toad");

@array2 = @array1;

$count = 1;

while ($count <= 5) {

   print ("element $count: $array1[$count - 1] ");

   print ("$array2[$count - 1]\n");

   $count++;

}


