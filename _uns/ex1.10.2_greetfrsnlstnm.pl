#!/usr/bin/perl -w

print ("\n");

print ("What is your first name?\n");
print ("\n");

$firstname = <STDIN>;
print ("\n");

print ("What is your last name?\n");
print ("\n");

$lastname = <STDIN>;
print ("\n");

# remove trailing new lines.
chomp ($firstname);
chomp ($lastname);
#
# CHOMP vs CHOP:
# --------------
# chomp is used specifically to remove 'return' character
# from end of variables.  chop will remove any character,
# alphnumeric, ASCII, or othewise.
#

print ("Greetings to you, $firstname $lastname!\n");
print ("\n");

#----------
$hold = <STDIN>;
#
# From now on, I will use $hold to keep the window
# open, and use it basically as a 'semi-reserved' 
# variable.