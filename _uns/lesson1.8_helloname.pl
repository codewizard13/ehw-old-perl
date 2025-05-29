#!/usr/bin/perl -w

print ("\n");

print ("What is your name?\n");
print ("\n");

$name = <STDIN>;
print ("\n");

chomp ($name);
#
# CHOMP vs CHOP:
# --------------
# chomp is used specifically to remove 'return' character
# from end of variables.  chop will remove any character,
# alphnumeric, ASCII, or othewise.
#

print ("Hello, $name!\n");
print ("\n");

#----------
$hold = <STDIN>;
#
# From now on, I will use $hold to keep the window
# open, and use it basically as a 'semi-reserved' 
# variable.