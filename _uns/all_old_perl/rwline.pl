#!/usr/bin/perl
#
# Program:	rwline.pl
# Creator:	Eric Hepperle
# Date:		01/08/01
#
# Purpose:	Not my script.  Simple script that repeats a line of text (emulates the echo command), and auto-escapes (no ctrl-d necessary).
#
####################################################

$inputline = <STDIN>;
print( "$inputline" );
