#!/usr/bin/perl
#
# Program:	launchfileswperl.pl
# Creator:	Eric Hepperle
# Date:	01/01/02
#
# Purpose:	Test to open multiple programs with one perl script.
#
##################################################3

print "\n\n";

print "(Press any key to BEGIN:)\n\n";
$begin = <STDIN>;

# launch realplayer.

#$launch_real = `start realplay`;

#$launch_real;

# Here are the full paths to common applications:
#
# Real Player:	C:\Program Files\Real\RealPlayer\realplay.exe
# Black Widow:	C:\Program Files\BlackWidow\BlackWidow.exe
# Norton's AV:	C:\Program Files\Norton AntiVirus\NAVW32.EXE
# IE Explorer:	C:\Program Files\Internet Explorer\IEXPLORE.EXE
# Netscape:		C:\Program Files\Netscape\Netscape 6\netscp6.exe
# Multiproxy:	C:\Program Files\MultiProxy\MProxy.exe
# Winamp:		C:\Program Files\Winamp\winamp.exe
# Windows Washer:	C:\Program Files\Washer\autowash.exe
#
#

# Define application name scalars:
#
$realp = "C:/PROGRA~1/Real/RealPlayer/realplay.exe";
$widow = "C:/PROGRA~1/BlackWidow/BlackWidow.exe";
$nortonav = "C:/PROGRA~1/NORTON~1/NAVW32.exe";
$msie = "C:/PROGRA~1/INTERN~1/IEXPLORE.exe";
$netscape = "C:/PROGRA~1/Netscape/NETSCA~1/netscp6.exe";
$mproxy ="C:/PROGRA~1/MultiProxy/MProxy.exe";
$winamp = "C:/PROGRA~1/Winamp/winamp.exe";
$winwash = "C:/PROGRA~1/Washer/autowash.exe";

# Define special webpages:
#
$stills = "http://www.stilllistener.addr.com/checkpoint1/index2.shtml";

#
# NOTE:	You can use the 'start' function to launch a program
#		only if that program is listed in the path.  Otherwise,
#		it is better to use the following:
#
#		print system 'start <app>';






@applications = ($realp, $widow, $nortonav, $stills, $msie, $netscape, $mproxy, $winamp, $winwash);


foreach $ap (@applications) {

#   $launchap = `start $ap`;
#   $launchap;

   print system "start $ap";

}


print "PRESS ANY KEY TO QUIT.";
$hold = <STDIN>;
