#!/usr/bin/perl

################################################################################
##
## FILE:      folderRecurse.pl
## CREATOR:   Eric Hepperle
## DATE:      09/16/11
##
## PURPOSE:   Process all files and subdirectories in a folder.
##
## RETURNS:   ...
##
## ARGUMENTS: ...
##
## NOTES:     09/16/11, 04:00 - Created file.
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

use File::Find;



################################################################################
##
## MAIN
##
################################################################################


main(@ARGV); # pull in command line arguments


sub main
{
  message("Perl code goes here!");

  my $dir = "s:/[programming]";

  print "<?php";
  find(\&edits, $dir);
  print "?>";

  sub edits() {
    # original from http://www.gossland.com/course/files/recursive.html
    # (best explanation of File::Find!)
    # print "File name is $_\n\t\tFull path is $File::Find::name\n";
    
    # build a php file
    print "<a href='";
    print "File name is $_\n\t\tFull path is $File::Find::name\n";
    print "' target='new'>$File::Find::name</a>";
  }

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

#
#
#
#
