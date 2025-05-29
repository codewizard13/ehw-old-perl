#!/usr/bin/perl -w
#
# Program:	ehlaunchexplorer_page.txt
# Creator:		Eric Hepperle
# Date:		09/16/01
#
# Purpose:	Testing to see if I can launch
#		a web page in internet explorer.
#


$hold = ();
$explorer = "iexplore.exe";
$explorer2 = "iexploere";
$ans = ();

print "This is a test to launch internet explorer\n\n";

print "Press any key to begin.\n";
$hold = <STDIN>;

# This should launch explorer:
#C:\Program Files\Internet Explorer

#file:///c:/program files/internet explorer/iexplore.exe;


system("$explorer");

print "Did internet explorer launch successfully";
$ans = <STDIN>;

system("$explorer2");

$hold = <STDIN>;