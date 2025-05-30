#!/usr/bin/perl
#
# Program:	grepanarray.pl
# Creator:	Eric Hepperle
# Date:		09/14/01
#
# Purpose:	A simple script that finds and prints all lines in a specified text file which contain worda and/or wordb.  It finds all instances, not just the first.
#
##############################################33333

open (FILE, "/afs/rchland.ibm.com/usr3/v2cib484/myfile") or die "can't open myfile: $!";
      @lines = <FILE>;
      print grep /terrorism|nuclear/i, @lines;
      print "\n";
close (FILE);
