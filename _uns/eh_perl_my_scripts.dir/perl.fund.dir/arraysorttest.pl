#!/usr/bin/perl
#
# Program:	arraysorttest.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Create an array from user input, then sort and print
# sorted array list.
#
#################################################


# read the array from standard input one item at a time

print ("Enter the array to sort, one item at a time.\n");

print ("Enter an empty line to quit.\n");

$count = 1;

$inputline = <STDIN>;

chop ($inputline);

while ($inputline ne "") {

   @array[$count - 1] = $inputline;

   $count++;

   $inputline = <STDIN>;

   chop ($inputline);

}

# now sort the array

$count = 1;

while ($count < @array) {

   $x = 1;

   while ($x < @array) {

      if ($array[$x - 1] gt $array[$x]) {

         @array[$x - 1, $x] = @array[$x, $x - 1];

      }

      $x++;

   }

   $count++;

}

# finally, print the sorted array

print ("@array\n");


