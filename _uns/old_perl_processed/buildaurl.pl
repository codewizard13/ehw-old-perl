#!/usr/bin/perl
#
# Program:                buildaurl.pl
# Creator:                Eric Hepperle
# Date:                09/17/01
#
# Purpose:                Simple create url technique
#                        juxtaposes strings against variables,
#                        etc...
#
###########################################################


$hold = ();

$file = "buildaurl_log000.txt";
#$logfile = "c:/windows/desktop/eh_ripped_htmldocs/$file";
$logfile = "c:/documents and settings/nunya_beezniss/desktop/$file";

print "This program will help you build a url from scratch:\n\n";

print "The url will be of the form:\n\n";
print "\$rtpath/\$picrt\$count.\$ext\n\n";

print "So, here is what these values would be and the url\n";
print "that should be produced:\n\n";

print "#######################################\n\n";
print "Given:\n";
print "------\n\n";
print "\$rtpath = \"http://www.briefcase.yahoo.com\"\n\n";
print "\$picrt = \"pic0a14q_\"\n\n";
print "\$count = 06 (or whatever the count is at the time,)\n\n";
print "\$ext = \"jpg\"\n\n";
print "then, the url produced should be:\n\n";
print "http://www.briefcase.yahoo.com/pic0a14q_06.jpg\n\n";
print "#######################################\n\n";


$rtpath = "http://www.briefcase.yahoo.com";
$picrt = "pic0a14q_";
$count = 06;
$ext = "jpg";


$url = $pictrt . $count . ". $ext";

print "The actual url that comes out is:\n";
print $url, "\n\n";


#############################################
# PRINT RESULTS TO A LOG FILE:
#############################################
#

open (FILE, ">$logfile");

print FILE "This program will help you build a url from scratch:\n\n";

print FILE "The url will be of the form:\n\n";
print FILE "\$rtpath/\$picrt\$count.\$ext\n\n";

print FILE "So, here is what these values would be and the url\n";
print FILE "that should be produced:\n\n";

print FILE "#######################################\n\n";
print FILE "Given:\n";
print FILE "------\n\n";
print FILE "\$rtpath = \"http://www.briefcase.yahoo.com\"\n\n";
print FILE "\$picrt = \"pic0a14q_\"\n\n";
print FILE "\$count = 06 (or whatever the count is at the time,)\n\n";
print FILE "\$ext = \"jpg\"\n\n";
print FILE "then, the url produced should be:\n\n";
print FILE "http://www.briefcase.yahoo.com/pic0a14q_06.jpg\n\n";
print FILE "#######################################\n\n";

print FILE "The actual url that comes out is:\n";
print FILE $url, "\n\n";

close (FILE);



print "Another version is:\n\n";



$hold = <STDIN>;