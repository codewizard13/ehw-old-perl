#!/usr/bin/perl
# File cshinprl_test1.pl created by Eric Hepperle at 08:43:23 on Fri Aug 24 2001. 
#
# Program:	cshinprl_test1.pl
# Creator:	Eric Hepperle
# Date:		08/24/01
#
# Purpose:	Simple demonstration of how to execute a shell command (csh) in a perl script; must use backticks.

$dfk = `df -k`;

print "\$dfk = $dfk\n";

print "\n";	
