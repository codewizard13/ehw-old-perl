#!/usr/bin/perl
#
# Program:	joinsngllns.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	Takes each line entered, adds a space at the end, and joins the lines together to make one line. Must exit program w/ <ctrl> + d.
#
#############################################



@input = <STDIN>;

chop (@input);

$string = join(" ", @input);

print ("$string\n");

$hold = <STDIN>;