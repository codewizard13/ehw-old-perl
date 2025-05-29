#!/usr/bin/perl
# File prtlstfrmrange.eh.perl created by Eric Hepperle at 14:09:26 on Thu Apr 19 2001. 
#
# Given a start number and an end number, this script prints
# a list of all the integers that fall between them.
#


print ("Enter the start number:\n");

$start = <STDIN>;

chop ($start);

print ("Enter the end number:\n");

$end = <STDIN>;

@list = ($start..$end);

$count = 0;

print ("Here is the list:\n");

while ($list[$count] != 0 || $list[$count - 1] == -1 ||

   $list[$count+1] == 1) {

   print ("$list[$count]\n");

   $count++;

   }

