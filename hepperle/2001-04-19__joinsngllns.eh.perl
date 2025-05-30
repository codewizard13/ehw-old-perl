#!/usr/bin/perl
# File joinsngllns.eh.perl created by Eric Hepperle at 16:34:11 on Thu Apr 19 2001. 
#
# Takes each line entered, adds a space at the end,
# and joins the lines together to make one line.
# Must exit program w/ <ctrl> + d.
#




@input = <STDIN>;

chop (@input);

$string = join(" ", @input);

print ("$string\n");

