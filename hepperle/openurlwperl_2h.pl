#!/usr/bin/perl
#
# Program:		openurlwprl.pl
# Creator:		Eric Hepperle
# Date:		09/17/01
#
# Purpose:		How to launch a specific website
#			in a browser using perl.
#
#			IT WORKS!!! BOTH METHODS WORK!!!
#
###########################################################


use CGI;

$testfile = "c:/windows/desktop/eh_ripped_htmlpages/openurlperl_test0000.html";
$file =();

system('start', "http://www.google.com");

system("explorer http://www.yahoo.com");