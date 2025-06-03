#!/usr/bin/perl -w
#
# Program:	eh_simmatchhtml.pl
# Creator:		Eric Hepperle
# Date:		09/20/01
#
# Purpose:	Pulls urls out of text (not html links)
#		and writes them to a file, then opens
#		the file in a new browser window.
#
########################################################
#

use LWP::Simple;


$infile = "c:/windows/desktop/eh_stripped_texturls.txt";
$srchptrn = "http://";

$url2srch = "http://bbs.room.ne.jp/~bbss/guestbook.cgi";

# enter the url to search:
#print "Enter the url you want to search for links: \n";
#$url2srch = <STDIN>;
#chomp $url2srch;

# This is the line that retrieves the html code.
$file = get ($url2srch);


# Store the retrieved html code:
#
open (INFILE,">$infile");

   print INFILE $file;

close (INFILE);


# Assign new page to an array for processing:
open (INFILE, "$infile");

   @infile = <INFILE>;

close (INFILE);


# Define the final output file:
$finalfile = "c:/windows/desktop/finalfile.html";


# Create final output file:
open (OUTFILE, ">$finalfile");

   print OUTFILE "<BR>\n";

   foreach $line (@infile) {

      if ($line =~ /$srchptrn/) {

         print "$line\n";
         
         # actually convert url to html link
         # and print to finalfile:
         #
         print OUTFILE "<A HREF = \"$line\" TARGET = TOP>$line</A><BR>\n";
      
      }

   }

   print "\n\n";

close (OUTFILE);

open (OUTFILE, "$finalfile");

   $finalfile = <OUTFILE>;

close (OUTFILE);

# open the outputfile in a new browser window:
#system ("explorer $finalfile");    

$hold = <STDIN>;