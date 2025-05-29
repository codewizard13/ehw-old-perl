#!/usr/local/bin/perl
#
# Program:	mi2km.pl
# Creator:	Eric Hepperle
# Date:		10/09/01
#
# Purpose:	Not my script.  This script lets user enter a number without units being specifiedto miles and converts that number to miles and kilometers.
#
###########################################################

print ("Enter the distance to be converted:\n");
$originaldist = <STDIN>;
chop ($originaldist);

$miles = $originaldist * 0.6214;

$kilometers = $originaldist * 1.609;

print ($originaldist, " kilometers = ", $miles,
       " miles\n");

print ($originaldist, " miles = ", $kilometers,
       " kilometers\n");


