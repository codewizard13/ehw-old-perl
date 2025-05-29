#!/usr/bin/perl
# File concatlntest.eh.perl created by Eric Hepperle at 08:34:42 on Thu Apr 19 2001. 
#
# This file allows user to type in an infinite number of
# strings, and then concatenates them into one
# mega-string.
#
# Taken from:
#    'TEACH YOURSELF PERL IN 21 DAYS'; 1995; SAM's Publishing;
#     David Till
#


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



