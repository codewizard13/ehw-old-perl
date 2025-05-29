#!/usr/bin/perl
#
# Program:	concatlntest.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	This file allows user to type in an infinite number of
#		strings, and then concatenates them into one
#		mega-string.
#
# Taken from:
#    'TEACH YOURSELF PERL IN 21 DAYS'; 1995; SAM's Publishing;
#     David Till
#
#######################################################


$resultstring = "";

print("Enter your input -- type an empty line to quit\n");

$input = <STDIN>;

chop ($input);

while ($input ne "") {

   $resultstring .= $input;
   $input = <STDIN>;
   chop ($input);

}

print ("Here is the final string:\n");

print ("$resultstring\n");



