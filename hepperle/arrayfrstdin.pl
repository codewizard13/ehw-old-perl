#!/usr/bin/perl
#
# Program:	arrayfrstdin.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Print array from standard input w/ no prompts.  Required to press <ctrl> + d to end program.
#
####################################################



@array = <STDIN>;

print (@array);


