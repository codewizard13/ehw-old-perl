#!/usr/bin/perl
#
# Program:    launchAppFromPerl_0628032.pl
# Creator:    Eric Hepperle
# Date:       06/28/03
#
# Purpose:    Launches applications specified by
#             user, using the system command.
#
#    ***** ALL OTHERS CAN BE DELETED !!! *******
#               !!! HALEILUJAH !!!
#
#--------------------------------------------------------------------




# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n\n";                  # insure starting margin

   initVars();

   getInput();

   launchApps();


   $hold = <STDIN>;               # end when user presses a key


} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




sub initVars
{
   # NOTE: Stored paths have to have backslash's,
   #       and spaces escaped, but paths entered
   #       at <STDIN> do not.
   #
   $app = "C:\\Program\ Files\\Windows\ Media\ Player\\mplayer2.exe";
   $app2 = "C:\\Program\ Files\\Winamp\\winamp.exe";
   $file = "C:\\Documents\ and\ Settings\\nunya_beezniss\\desktop\\myFile2.mp3";

   $pgfls = "C:\\Program\ Files";

   $app_acdsee = "$pgfls\\ACD\ Systems\\ACDSee\\ACDSee.exe";
   $app_winzip = "$pgfls\\WinZip\\winzip32.exe";
   $app_iexp = "$pgfls\\Internet\ Explorer\\iexplore.exe";
   $app_paint = "C:\\I386\\mspaint.exe";
   $app_ps6 = "$pgfls\\Adobe\\Photoshop\ 6.0\\Photoshp.exe";
   $app_acrobat = "$pgfls\\Adobe\\Acrobat\ 5.0\\Reader\\AcroRd32.exe";
   $app_acad = "$pgfls\\AutoCAD\ 2002\\acad.exe";
   $app_kremlin = "$pgfls\\Mach5\ Software\\Kremlin\\Kremlin\ Decrypt.exe";
   $app_vivtv = "$pgfls\\VivTV\\VivTV.viv";
   $app_notepad = "C:\\I386\\notepad.exe";
   $app_dvx2 = "$pgfls\\DivX\\DivX\ Player\ 2.0\ Alpha\\DivX\ Player\ 2.0\ Alpha.exe";
   $app_qt = "$pgfls\\QuickTime\\QuickTimePlayer.exe";
   $app_pinball = "C:\\I386\\pinball.exe";
   $app_mplay2 = "$pgfls\\Windows\ Media\ Player\\mplayer2.exe";
   $app_winamp = "$pgfls\\Winamp\\winamp.exe";


   @apps = ( $app_acdsee,
             $app_winzip,
             $app_iexp,
             $app_paint,
             $app_ps6,
             $app_acrobat,
             $app_acad,
             $app_kremlin,
             $app_vivtv,
             $app_notepad,
             $app_dvx2,
             $app_qt,
             $app_pinball,
             $app_mplay2,
             $app_winamp
             );


   $logFile = "c:\\documents\ and\ settings\\nunya_beezniss\\desktop\\logfile.txt";


} # end sub initVars




sub getInput
{
   print "ENTER AN APPLICATION NAME:\n";
   print " (C:\\Windows\\Program\ Files\\Desktop\\somefile, etc ...):\n";
   $pathChosen = <STDIN>;
   chomp($pathChosen);
   print "\n\n";

   if ($pathChosen eq "")
   {
      $pathChosen = $app;

   } # end if

   print "ENTER A FILE NAME:  ";
   $fileChosen = <STDIN>;
   chomp($fileChosen);
   print "\n\n";

   if ($fileChosen eq "")
   {
      $fileChosen = $file;

   } # end if


} # end sub getInput




sub launchApps
{
   open(LOG, ">$logFile");
      print LOG "#------------------------------------------#";

      system( "$pathChosen", "$fileChosen" );

      system( "$app", "$file" );

      system( "$app2", "$file" );

      foreach $app (@apps)
      {
         system( "$app" );

         print LOG "[ SUCCESSFULLY LAUNCHED ]\n$app\n\n";

      } # end foreach

   close(LOG);

} # end sub launchApps




