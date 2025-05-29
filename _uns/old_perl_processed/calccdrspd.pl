#!/usr/bin/perl
# File calccdrspd.eh.perl created by Eric Hepperle at 12:43:15 on Fri Jun 29 2001. 
#
# Program:	calccdrspd.eh.perl
# Creator:	Eric Hepperle
# Date:		*04/24/01	* (Actual Creation Date)
#
# Purpose:	Calculates avg. recording speed for CD-R media
#		based on capacity(MB) and actual record period
#		length.
#
#########################################


clr;
clear;

print ("Please enter the capacity of the CD-R\n");

  $ans = <STDIN>;

  $cap = $ans;
  chomp $cap;

print ("Please enter how long it takes to record a cd: \n");

  $ans = <STDIN>;

  $period = $ans;
  chomp $period;

$mbpermin = ( $cap/$period );

# This demonstrates some formatting.
$mbpermin = sprintf("%.2f",$mbpermin);

print ("The rounded version is = $mbpermin\n");

print "\n";

print ("The Average record speed in MB/min = $mbpermin\n");

print ("\n");

print ("\n");

$bitspermin = ($mbpermin * (1048) * (8));

print ("Speed in bits/min. = $bitspermin\n");

print ("\n");

$bytespermin = ($bitspermin/8);

print ("Speed in bytes/min. = $bytespermin\n");

print ("\n");
