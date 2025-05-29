#!/usr/bin/perl
#
# Program:     eh_launchAppFromPerl_5.pl
# Creator:     Eric Hepperle
# Date:        06/27/03
#
# Purpose:     Launch application from perl using system command.
#              Eventually will implement a "getExt" routine.
#
# CULL for 2nd VERSION of system command syntax ...
#



# -------------------------     [ MAIN ]    ------------------------- \\

# get a file from user
print "Enter the program you wish to launch:  ";

$progToUse = "C:\\Program\ Files\\Windows\ Media\ Player\\mplayer2.exe";
$fileToOpen = "C:\\my_file.mp3";


#----------------------------------------

system( " \"$progToUse\"\ $fileToOpen " );   # this works <--



#system("\C:\\Program\ Files\\Windows\ Media\ Player\\mplayer2.exe

#system( "\"C:\\Program\ Files\\Windows\ Media\ Player\\mplayer2.exe\"\ C:\\my_file.mp3");
#system(  " "C:\Program Files\Windows Media Player\mplayer2.exe" C:\my_file.mp3" );

$which = "this is a test";
print "Which is:     $which\n\n";
$which =~ s/test/quiz/;
print "Which is now: $which\n\n";



# With \\ converted to some other char (@@):
# replace all " with \"

#system(  " "C:\Program Files\Windows Media Player\mplayer2.exe" C:\my_file.mp3" );



   $hold = <STDIN>;

# ------------------------- [ SUBROUTINES ] ------------------------- \\


