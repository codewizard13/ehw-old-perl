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
# CULL FOR "EXEC" value...
#


# -------------------------     [ MAIN ]    ------------------------- \\

main();

sub main
{
   print "\n";                  # insure starting space
   &initializeVariables();
   &initMessage();

#   openurl();

#   launchPrograms();

   execTest();


   $hold = <STDIN>;

} # END sub main

# ------------------------- [ SUBROUTINES ] ------------------------- \\




sub initializeVariables
{
   $tenStr = "**********";
   $tenStarBorder = "$tenStr$tenStr$tenStr$tenStr";

} # end sub initializeVariables




sub initMessage
{
   $message = "If the starting position is before the beginning";
   $message = "$message of the string (like a huge negative number bigger";
   $message = "$message than the length of the string), the beginning of";
   $message = "$message  the string is the start position (as if you had";
   $message = "$message  used 0 for a starting position). If the start";
   $message = "$message  position is a huge positive number, the empty";
   $message = "$message  string is always returned. In other words, it";
   $message = "$message  probably does what you expect it to do, as long";
   $message = "$message  as you expect it to always return something";
   $message = "$message  other than an error.";

   return $message;

} # end sub initMessage




sub openurl {


$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
system ("explorer $page");

$netscape_path = "file:///C:/WINDOWS/Desktop/EH New Files Post-051301/EH ALL APPLICATIONS CUMULATIVE INVENTORY/APPS - Internet/Netscape Backup Files/Netscape/Netscape 6/netscp6.exe";


#system ("netscp6 $page");

#$hold = <STDIN>;

}




sub launchPrograms
{
   $execString = 'C:\Program Files\Internet Explorer\iexplore.exe';
   $acdseeStr = "file:///C:/Program Files/ACD Systems/ACDSee/ACDSee.exe";

   print "LAUNCHING GOOGLE with iexplore.exe NOW ...\n\n";
   system ($execString "http://www.google.com");

#   exec $execString;
   $testPic = "file:///C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Tawnee - Skirt White 16 LMB.jpg";
   $testPic2 = "C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Tawnee - Skirt White 16 LMB.jpg";
#   exec "$acdseeStr ";

   print "LAUNCHING Acdsee with system command ..\n\n";
   system ($acdseeStr);

   # TRACING:-----------------------------

   print "\n\n\n...X-FILES ...\n\n\n";


   $file = 'file:///C:/Program Files/ACD Systems/ACDSee/ACDSee.exe';
   $file2 = "file:///C:/Program Files/ACD Systems/ACDSee/ACDSee.exe";

   print "LAUNCHING Acdsee with \'explorer\'...\n\n";
   system ("explorer $file");

   print "LAUNCHING FILE 2 (Acdsee Application) NOW ...\n\n";
   system ("$file2");

   print "LAUNCHING FILE 2 WITH A testPic2 ...\n\n";
   system ($file2 $testPic2);

   $netscape_path = "file:///C:/WINDOWS/Desktop/EH New Files Post-051301/EH ALL APPLICATIONS CUMULATIVE INVENTORY/APPS - Internet/Netscape Backup Files/Netscape/Netscape 6/netscp6.exe";

   #---------------------------------------

} # end launchPrograms




sub execTest
{
   $app_acdsee = `C:/Program Files/ACD Systems/ACDSee/ACDSee.exe`;
   $testPic2 = "C:/Documents and Settings/Nunya_beezniss/Desktop/ALL FILES/spxvz/incredible/eatery/super/club/casino/WhatchaThink/completeTeen/Tawnee - Skirt White 16 LMB.jpg";
   print "EXECTEST BEGINS HERE ...\n\n";
#   exec ('')   or print STDERR "couldn't exec foo: $!";

#   exec `$app_acdsee "$testPic2"`;
   exec `$testPic2`;

   @args = ( "echo surprise" );
   exec @args;
} # end sub execTest