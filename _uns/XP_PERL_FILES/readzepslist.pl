#!/usr/bin/perl

# Program:	readzepslist.pl
# Creator:	Eric Hepperle
# Date:	12/16/01

print "\n\n";

# get full path and filename of proxy list:
print "ENTER THE PATH TO THE list file: \n\n";
$path = <STDIN>;
chomp $path;

print "\n";

# store proxy list contents in an array.
open (LIST, "$path");
   @proxyinfo = <LIST>;
close (LIST);


$outfile = "c:/windows/desktop/zepsbbss_processed.txt";

# open output file for append.
open (OUT, ">$outfile");

   foreach $line (@proxyinfo) {

      chomp $line;

      substr($line, 0) =~ s/http:/, http:/g;

      @spline = split(/##/, $line);

      foreach $el (@spline) {

         $name = $spline[0];
         $bbsurl = $spline[1];

      }

      print OUT "$name $bbsurl\n";

   }

close (OUT);

$hold = <STDIN>;

   







