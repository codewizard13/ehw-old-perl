#!/usr/bin/perl
#
# Program:	prtlstfrmrange.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Given a start number and an end number, this script prints a list of all the integers that fall between them.
#
#######################################################


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

