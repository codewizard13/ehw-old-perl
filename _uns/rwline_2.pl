#!/usr/bin/perl
#
# Not my script.  Simple script that repeats a line of text (emulates the echo command), and auto-escapes (no ctrl-d necessary).

$inputline = <STDIN>;
print( "$inputline" );

$hold = <STDIN>;
