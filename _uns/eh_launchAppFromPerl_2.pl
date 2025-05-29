#!/usr/bin/perl
#
# Program:     eh_launchAppFromPerl_1.pl
# Creator:     Eric Hepperle
# Date:        06/26/03
#
# Purpose:     Test of wrap sub.
#
# !!! WORKS SO FAR !!!
#
# DOESN'T ALLOW PROG TO OPEN A FILE
#
# demonstrates using BACKTICKS to open app or file.
# file will only open with associated app.
# 


# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space

   execTest();

   $hold = <STDIN>;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




sub execTest
{
   # use backticks and assignment operator to
   #  launch an application and change / to \:
   $app_acdsee = `C:/Program Files/ACD Systems/ACDSee/ACDSee.exe`;
   $app_iexplorer = `C:/Program Files/Internet Explorer/iexplore.exe`;
   $app_kremlin = `C:/Program Files/Mach5 Software/Kremlin/Kremlin Decrypt.exe`;

   $testPic2 = "C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Tawnee - Skirt White 16 LMB.jpg";
   $testMov1 = "C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Bizzare Insertion - Blonde with a Coke Bottle.mpeg";
   print "EXECTEST BEGINS HERE ...\n\n";

   exec `$testPic2`;
   exec `$testMov1`;

#   @args = ( "echo surprise" );
#   exec @args;
} # end sub execTest