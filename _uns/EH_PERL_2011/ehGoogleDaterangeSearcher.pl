#!/usr/bin/perl

################################################################################
##
## FILE:      ehGoogleDaterangeSearcher.pl
## CREATOR:   Eric Hepperle
## DATE:      06/04/11
##
## PURPOSE:   Use the little known "daterange" search feature in Google
##            to search google by specific from and to dates.  The
##            feature requires dates in Julian notation.
##
##
## NOTES:     06/04/11, 12:25 - Created file.
##            (Note: Credit is given where significant code content is
##            copied from other sources).
##
##                            - Created main, message, and error functions.
##
##                            - Completed file creation.
##
##                      12:45 - Created algorithm.
##
##                      13:12 - Began testing time/date functions.
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
  # TESTING: Time & date functions
  message("time(): " . time());
  message("localtime(): " . localtime());
  message("gmtime(): " . gmtime());
  print ("\n\n\n");



  # 1) Have user pick start date from calendar chooser
  # 2) Convert date to Julian notation
  # 3) Round start date down
  #
  # 4) Have user pick end date from calendar chooser
  # 5) Convert date to Julian notation
  # 6) Round start date up
  #
  # 7) Get search string
  # 8) Build daterange search string
  # 9) Launch google with search string

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


############################3 TESTING ####################

