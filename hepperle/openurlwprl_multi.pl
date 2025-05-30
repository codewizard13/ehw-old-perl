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

#############################################
# INITIALIZE VARIABLES:
#############################################
#
$file = "openurlperl_test0000.html";
$logfile = "c:/windows/desktop/eh_ripped_htmldocs/$file";
$count = 0;

#############################################
# GET INPUT FROM USER:
#############################################
#
print  "Enter the start number:";
$start = <STDIN>;
chomp $start;

print "Enter the end number:";
$end = <STDIN>;
chomp $end;

print "What is the root path of the pix?:\n";
$path = <STDIN>;
chomp $path;

print "What is the name of the non-counting root of the pix?:\n";
$picrt = <STDIN>;
chomp $picrt;

&countsub;


#############################################
# SUBROUTINES:
#############################################
#

sub countsub {

   for $count ($start..$end) {

      $testfile = "$path/$picrt$count\.jpg";
      # should print like this:
      #
#	$docname = $docname.".html";

      # EX:	"$path/$picrt$count",".jpg"
   
#      &openurl;

      print "opened: $testfile\n\n";

   }
   
$hold = <STDIN>;

}


sub openurl {

open (TEST, ">$logfile");

   print TEST "opened $testfile successfully!\n\n";
   
   # THIS LINE LAUNCHES EXPLORER WINDOW:
   system("explorer $testfile");

   # other way:
   # system('start', "http://www.google.com");

close (TEST);


}