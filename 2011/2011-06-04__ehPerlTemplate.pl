#!/usr/bin/perl

################################################################################
##
## FILE:      ehPerlTemplate_2011.06.01.pl
## CREATOR:   Eric Hepperle
## DATE:      06/01/11
##
## PURPOSE:   My template for building perl programs
##
##
## NOTES:     06/01/11, 08:15 - Created file.
##            (Note: Credit is given where significan code content is
##            copied from other sources).
##
##                      8:50 - Created main, message, and error functions.
##
##                      9:05 - Completed file creation.
##
##
################################################################################


#
# Use least-breakable code
#
use strict;
use warnings;




################################################################################
##
## MAIN
##
################################################################################


main(@ARGV); # pull in command line arguments


sub main
{
  message("Perl code goes here!");
}


################################################################################
##
## SUBROUTINES
##
################################################################################


#   message()
#
# prints a string to the console/screen and automatically removes newlines.
#
sub message
{
  my $m = shift or return;
  print("$m\n");
}


#   error()
#
# gets system errors and prints to console/screen.
#
sub error
{
  my $e = shift || 'unkown error';
  print(STDERR "$0: $e\n");
  exit 0;
}