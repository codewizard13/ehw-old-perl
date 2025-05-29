#!/usr/bin/perl
# File arrayfrstdin.eh.perl created by Eric Hepperle at 16:21:27 on Thu Apr 19 2001. 
#
# Print array from standard input w/ no prompts.
# Required to press <ctrl> + d to end program.
#



@array = <STDIN>;

print (@array);


