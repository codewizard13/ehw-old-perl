#!/usr/bin/perl
# File arraycpyncomp.eh.perl created by Eric Hepperle at 14:21:04 on Thu Apr 19 2001.
#
# Copy the elements of one array to another and then compare
# the resulting array to check for any differences, (there
# should be none)
#


@array1 = (14, "cheeseburger", 1.23, -7, "toad");

@array2 = @array1;

$count = 1;

while ($count <= 5) {

   print ("element $count: $array1[$count - 1] ");

   print ("$array2[$count - 1]\n");

   $count++;

}


