#!/usr/bin/perl
# File ehmakeurltest.pl created by Eric Hepperle at 07:47:26 on Tue Sep 18 2001. 
#
# Program:	ehmakeurltest.pl
# Creator:	Eric Hepperle
# Date:		09/18/01
#
# Purpose:	Demonstrates various ways to concatenate/join text and variables together to create url's, ip's, etc...


################################################
# DEFINE TEST VARIABLES:
################################################
#
$rtpath = "http://www.news.com";

$picrt = "pageq_";

$count = 06;	#(or whatever the count is at the time,)

$ext = "html";


################################################
# VARIOUS ATTEMPTS TO CREATE THE URL:
################################################

$url_t1 = "$rtpath/$picrt$count.$ext";

$url_t2 = "$rtpath/$picrt$count..$ext";

$url_t3 = "$rtpath/" . "$picrt" . "$count" . ".$ext";

$url_t4 = "$rtpath/$picrt$count.\$ext";


################################################
# PRINT URL TEST OUTPUT:
################################################
#
# NOTE:		These worked on my AIX box at
#		work, but do not work on my
#		PC for some reason.
#

print $url_t1;
print "\n";
print $url_t2;
print "\n";
print $url_t3;
print "\n";
print $url_t4;
print "\n";


