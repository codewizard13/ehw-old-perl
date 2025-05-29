#!/usr/bin/perl

################################################################################
##
## FILE:      ehFileFindTest.pl
## CREATOR:   Eric Hepperle
## DATE:      06/11/11
##
## PURPOSE:   Testing the File::Find module for recursive actions.
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
## NOTES:     06/11/11, 22:05 - Created file.
##            (Note: Credit is given where significant code content is
##            copied from other sources).
##
##                            - Created main, message, and error functions.
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
  
  
  
  find(\&processDirs, $startDir);


  
  
  
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


#   getEnvVars()
#
# gets environment variables and prints to screen
#
sub getEnvVars
{
  foreach my $key (keys(%ENV)) {

    printf("%-10.10s: $ENV{$key}\n", $key);

  }

}


#   printRDirs()
#
# gets a list of directories recursively.  prints filename and fully-qualified
# path.
#
sub printRDirs() # not
{
  print "File name is $_\n\t\tFull path is $File::Find::name\n";
}


#   processDirs()
#
# caller sub for all other subs during the recursion of directories
#
# NOTE: This code modified from
sub processDirs
{
  # use "." as the default dir if no cmd line args.
  @ARGV = ('.') unless @ARGV;
  
  # get the first element of the passed arguments array (ie: the root dir).
  my $dir = shift @ARGV;
  
  find(\&edits, $dir); # run the find command that implements File::Find
  
  # process each file found
  sub edits()
  {
    return unless -f;        #skip directories
    
    my $seen = 0;  # count how many matching files were found
    
    my $file = $_;
    
    #Uncomment next line if you want multi-line edits
    #undef $/;
    
    local $^I=".backup";
    
    #Warning - heavy magic here
    local @ARGV = ($file);
    
    while(<>) {
      #Remember to use the s option if doing multiline edits
      $seen++ if s/Lesson/Chapter/;
      print;
    }
    
    print "Found in $File::Find::name\n" if $seen > 0;
    
    #Comment out if you want to keep the backup
    #unlink $file.".backup";
  }
    
}


#################################  END SUBS #################################
