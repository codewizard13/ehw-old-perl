#!/usr/bin/perl
#
# Program:	simpasswdcheck.pl
# Creator:	Eric Hepperle
# Date:		04/19/01
#
# Purpose:	This is a very simple password checker script.
#
#########################################################


print ("Enter the secret password:\n");

$password = "bluejays";

$inputline = <STDIN>;

chop ($inputline);

$outputline = $inputline eq $password ?

   "Yes, that is the correct password!\n" :

   "No, that is not the correct password.\n";

print ($outputline);
