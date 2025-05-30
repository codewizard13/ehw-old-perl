#!/usr/bin/perl
#
# Program:	arraytest1.pl
# Creator:	Eric Hepperle
# Date:		03/21/01
#
# Purpose:	Test script to demonstrate reading array variables and displaying them in a specific line format.  (For example: el 1, el 2, etc ...)
#
###################################################


clear;

@array = (11, 23, far, tom, line, etc);

$count = 1;

while ($count <= 5) {

   print ("element $count is $array[$count-1]\n");
   $count++;

}

