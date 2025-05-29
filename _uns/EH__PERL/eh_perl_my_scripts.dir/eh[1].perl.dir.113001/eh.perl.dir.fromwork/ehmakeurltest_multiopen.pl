#!/usr/bin/perl
# File ehmakeurltest.pl created by Eric Hepperle at 07:47:26 on Tue Sep 18 2001.
#
# Program:	ehmakeurltest_multiopen.pl
# Creator:	Eric Hepperle
# Date:		09/18/01
#
# Purpose:	Opens sequentially numbered urls automatically.  Usefull if you are on http://www.yahoo.com/news/article_a01_news.html and you know there are 5 more pages, you can set the start number to "01" and end to "06", then you enter the url formatting info and walla! -- up pops 6 pages of the article!






################################################
# DEFINE TEST VARIABLES:
################################################
#
$rtpath = "http://www.news.com";

$picrt = "pageq_";

$count = 06;	#(or whatever the count is at the time,)

$picsuf = ();

$ext = "html";

################################################
# GET INPUT FROM USER:
################################################
#

print "Enter the start number: ";
$start = <STDIN>;
chomp $start;

print "Enter the ending number: ";
$end = <STDIN>;
chomp $end;

print "Enter the root path of the url: \n";
$rtpath = <STDIN>;
chomp $rtpath;

print "Enter the static doc name root part: ";
$picrt = <STDIN>;
chomp $picrt;

print "Enter the doc name suffix:";
$picsuf = <STDIN>;
chomp $picsuf;

print "Enter the extension: ";
$ext = <STDIN>;
chomp $ext;




&openmultiwindows;

$hold = <STDIN>;

sub createurl {

################################################
# VARIOUS ATTEMPTS TO CREATE THE URL:
################################################

$url_t1 = "$rtpath/$picrt$count$picsuf.$ext";

$url_t2 = "$rtpath/" . "$picrt" . "$count" . "$picsuf" . ".$ext";

################################################
# PRINT URL TEST OUTPUT:
################################################
#
# NOTE:		These worked on my AIX box at
#		work, but do not work on my
#		PC for some reason.
#
print "\n\n";
print $url_t1;
print "\n\n";
print "another version ...\n";
print $url_t2;
print "\n";

}



sub openmultiwindows {

   for $count ($start..$end) {

   &createurl;
   
   &openurl;

   print "opened: $url_t1\n\n";

   }

}


sub openurl {

$page = $url_t1;
$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
#system ("explorer $file");

system ("netscape $page");

#$hold = <STDIN>;

}
