#!/usr/bin/perl
# File wrdcounttest.eh.perl created by Eric Hepperle at 13:36:05 on Fri Apr 20 2001. 
#
# Counts the number of words user enters and displays
# result.  Any two consecutive spaces are interpreted as
# a space and a word. Must use <ctrl> + d to exit.
#



$wordcount = 0;

$line = <STDIN>;

while ($line ne "") {

   chop ($line);

   @array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;

}

print ("Total number of words: $wordcount\n");


