#!/usr/bin/perl

# Program:	snatchhostandport.pl
# Creator:	Eric Hepperle
# Date:	12/16/01

print "\n\n";

# get full path and filename of proxy list:
print "ENTER THE PATH TO THE PROXY: \n\n";
$path = <STDIN>;
chomp $path;

print "\n";

# store proxy list contents in an array.
open (LIST, "$path");
   @proxyinfo = <LIST>;
close (LIST);


$outfile = "c:/windows/desktop/master_proxylist.txt";

# open output file for append.
open (OUT, ">>$outfile");

   foreach $line (@proxyinfo) {

      chomp $line;

      @spline = split(/\s+/, $line);

      foreach $el (@spline) {

         $proxy = $spline[0];
         $port = $spline[1];

      }

      print OUT "$proxy:$port\n";

   }

close (OUT);

$hold = <STDIN>;

   







