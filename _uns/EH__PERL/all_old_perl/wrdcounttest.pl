#!/usr/bin/perl
#
# Program:	wrdcounttest.pl
# Creator:	Eric Hepperle
# Date:		04/20/01
#
# Purpose:	Counts the number of words user enters and displays
# result.  Any two consecutive spaces are interpreted as
# a space and a word. Must use <ctrl> + d to exit.
#
###############################################



$wordcount = 0;

$line = <STDIN>;

while ($line ne "") {

   chop ($line);

   @array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;

}

print ("Total number of words: $wordcount\n");


