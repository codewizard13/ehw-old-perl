#!/usr/bin/perl
# File grepanarray.pl created by Eric Hepperle at 15:00:04 on Fri Sep 14 2001. 
#
# Program:	grepanarray.pl
# Creator:	Eric Hepperle
# Date:		09/14/01
#
# Purpose:	A simple script that finds and prints all lines in a specified text file which contain worda and/or wordb.  It finds all instances, not just the first.

open (FILE, "/afs/rchland.ibm.com/usr3/v2cib484/myfile") or die "can't open myfile: $!";
      @lines = <FILE>;
      print grep /terrorism|nuclear/i, @lines;
      print "\n";
close (FILE);
