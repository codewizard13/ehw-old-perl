#!/usr/bin/perl
#
# Program:	caseconv.pl
# Creator:	Eric Hepperle
# Date:		02/28/01
#
# Purpose:	Demonstrates converting input to all lowercase or all uppercase.
#
######################################################

print ("Enter a line of input:\n");
$inputline = <STDIN>;
print ("uppercase: \U$inputline\E\n");
print ("lowercase: \L$inputline\E\n");
print ("as a sentence: \L\u$inputline\E\n");

