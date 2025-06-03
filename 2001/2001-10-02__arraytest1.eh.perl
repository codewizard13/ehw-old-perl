#!/usr/bin/perl
# File htmlcycler.eh.perl created by Eric Hepperle at 13:37:41 on Wed Mar 21 2001. 
#
# Program:	arraytest1.eh.perl
# Creator:	Eric Hepperle
# Date:		03/21/01
#
# Purpose:	Test script to demonstrate reading array variables and displaying them in a specific line format.  (For example: el 1, el 2, etc ...)


clear;

@array = (11, 23, far, tom, line, etc);

$count = 1;

while ($count <= 5) {

   print ("element $count is $array[$count-1]\n");
   $count++;

}

