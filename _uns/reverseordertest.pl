#!/usr/bin/perl
#
# Program:	reverseordertest.pl
# Creator:	Eric Hepperle
# Date:		04/20/01
#
# Purpose:	This script demonstrates how to print words that the user
# enters, in reverse order.  Must use <ctrl> + d to quit.
#
##################################################



@input = <STDIN>;

chomp (@input);

# first, reverse the order of the words in each line

$currline = 1;

while ($currline <= @input) {

   @words = split (/ /, $input[$currline - 1]);

   @words = reverse(@words);

   $input[$currline - 1] = join(" ", @words, "\n");

   $currline++;

}

# now, reverse the order of the input lines and print them

@input = reverse(@input);

print (@input);
