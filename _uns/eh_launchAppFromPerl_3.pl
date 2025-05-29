#!/usr/bin/perl
#
# Program:     eh_launchAppFromPerl_1.pl
# Creator:     Eric Hepperle
# Date:        06/26/03
#
# Purpose:     Launch application from perl using system command
#
#  UNSURE: keep makeMenu? ...]
#



# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space

   makeMenu();
   printAppMenu();
   getInput();
   execTest();

   $hold = <STDIN>;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




sub makeMenu
{
   @menuItems = qw( ACDSee,
                    WinZip,
                    Internet Explorer,
                    Paint,
                    Adobe Photoshop,
                    Adobe Acrobat,
                    Autocad,
                    Kremlin,
                    VivTV,
                    Notepad,
                    Divx Player 2.0,
                    Quicktime,
                    Windows Media Player,
                  );

} # end sub makeMenu




sub printAppMenu
{
   print "=======================================================\n\n";
   print "                        [ MENU ]\n\n\n";

   $count = 1;
   foreach $el (@menuItems)
   {
      print "\t$count.  $el\n";

      $count++;

   } # end foreach

   print "\n\n";
   print "=======================================================\n\n";

} # end sub printAppMenu




sub getInput
{
   print "What application do you wish to use?  ";
   $ans = <STDIN>;
   chomp($ans);

   translateAns();

} # end sub getInput




# determines which program to use
sub translateAns
{


} # end sub translateAns




sub execTest
{
   $app_acdsee = "C:/Program Files/ACD Systems/ACDSee/ACDSee.exe";
   $testPic2 = "C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Tawnee - Skirt White 16 LMB.jpg";
   print "EXECTEST BEGINS HERE ...\n\n";

   exec `$testPic2`;

#   @args = ( "echo surprise" );

   @args = ( "$app_acdsee $testPic2" );
   exec @args;

   #   exec @args;
} # end sub execTest