#!/usr/bin/perl
# File howtolistdir.pl created by Eric Hepperle at 14:32:09 on Wed Oct 24 2001. 
#
# Program:	howtolistdir.pl
# Creator:	Eric Hepperle
# Date:		10/24/01
#
# Purpose:	Simple demonstration of how to list the contents of a directory in perl.
#
######################################3
#
# Edited:	10/08/02	- Writes dir to a webpage and a text file.


#$dir = "/afs/rchland.ibm.com/usr3/v2cib484/tmp";
$maindir = "c:/documents and settings/nunya_beezniss/desktop";
$htmlfile = "$maindir/dirlist.html";
$textfile = "$maindir/dirlist.txt";

print "Enter the directory to list out:  \n";
$dir = <STDIN>;
chomp $dir;


sub error {

   my($error) = @_;

   print("Error: $error\n");

}


opendir(CGIBIN, "$dir") || error("NO: $!\n");

@entries = sort(readdir(CGIBIN)); ### sort the entries like a good kid

closedir(CGIBIN);


# Open text file:
open (TXTFL, ">>$textfile");
# Open html file:
open (HTMLFL, ">>$htmlfile");


print "Reading: $dir/n/n";
print "Dir Test 2/n/n";


# Record html file and text file:
foreach $entry (@entries) {

   # Display results to screen:
   print("Entry: $entry\n");

   # Print results to text file:
   print TXTFL "$entry\n";

   # Print results to html file:
   print HTMLFL "<a href = \"$dir/$entry\">$entry</a><br>\n";


}


# Close text and html files
close (TXTFL);

print HTMLFL "<BR><BR>\n";
close (HTMLFL);

$hold = <STDIN>;