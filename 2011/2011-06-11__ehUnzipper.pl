#!/usr/bin/perl

################################################################################
##
## FILE:      ehUnzipper.pl
## CREATOR:   Eric Hepperle
## DATE:      06/11/11
##
## PURPOSE:   Unzips all compressed files in a folder & subfolders.
##
## ARGUMENTS: Start directory.
##
## RETURNS:   None.
##
## REQUIRES:  Modules:
##              IO:File
##              Win32
##              Win32::Process
##              Archive::Unrar
##              File::Find
##              
##
##            Plain Files:
##
##
## NOTES:     06/11/11, 11:20 - Created file.
##            (Note: Credit is given where significant code content is
##            copied from other sources).
##
##                            - Created main, message, and error functions.
##
##                            - Completed file creation.
##
##                     11:25, - Built Algorithm.
##
##                     12:40, - Began writing Windows-testable code.
##                           
##
##
################################################################################


#
# Use least-breakable code
#
use strict;
use warnings;
use Archive::Unrar;
use File::Find;




################################################################################
##
## MAIN
##
################################################################################

main(@ARGV); # pull in command line arguments

sub main
{
  # 1) Begin in start directory, pull from args
  my $startDir = getStartDir();
  #print ("getStartDir() output is: $startDir\n\n");
  
  ##print ("END MAIN\n");
  #my $sysRoot = $ENV{"SYSTEMROOT"};
  #print ("\$sysRoot = $sysRoot\n\n");
  #print %ENV;

#Gets all Environment variables:
foreach my $key (keys(%ENV)) {
    printf("%-10.10s: $ENV{$key}\n", $key);
}

message("\n\n");
  
  # 2) Find all compressed files
  # get file list
    

find(\&edits, $startDir);

sub edits()
{
  print "File name is $_\n\t\tFull path is $File::Find::name\n";
}

  
  
  
  #    A) If file is a .zip
  #       1) Uncompress Zip file
  #           a) if new zip folder contains zip or rar files
  #               1. Goto 2)
  
  #    B) Else if file is a .rar file
  #       1) Uncompress rar file
  #           a) if new rar folder contains zip or rar files
  #               1. Goto 2)
  
  #    C) Else filetype not determined
  #       1) Give user error msg

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


#   getStartDir()
#
# gets start directory.
#
sub getStartDir
{
  # steps to get start dir
  print ("Start directory will should be returned here.\n\n");
  
  # Testing system() command ... should open command prompt
  #system("cmd ");
  
  
  my $dir = "C:\\test\\";
  print ("\$dir = $dir\n\n");
  
  return $dir;
}


#################################  END SUBS #################################
