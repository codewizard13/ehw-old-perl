#!/usr/bin/perl
# File howtolistdir.pl created by Eric Hepperle at 14:32:09 on Wed Oct 24 2001. 
#
# Program:	howtolistdir_replace_r1.pl
# Creator:	Eric Hepperle
# Date:		11/02/02
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
$selectedDir = <STDIN>;
chomp $selectedDir;


sub error {

   my($error) = @_;

   print("Error: $error\n");

}


opendir(CGIBIN, "$selectedDir") || error("NO: $!\n");

@entries = sort(readdir(CGIBIN)); ### sort the entries like a good kid

closedir(CGIBIN);


# Initialize HTML file (11/02)
open (HTMLFL, ">$htmlfile");
	# Print  the path name as a link:
	print HTMLFL "\n\n";
	print HTMLFL "******************************************************<br>\n";
	print HTMLFL "These are the files located in:<br>\n\n";
	print HTMLFL "<a href = \"$selectedDir\">$selectedDir</a><br><br>\n\n";
	print HTMLFL "******************************************************<br>\n";
close (HTMLFL);


# Open text file:
open (TXTFL, ">$textfile");
# Open html file:
open (HTMLFL, ">>$htmlfile");


print "Reading: $selectedDir/n/n";
print "Dir Test 2/n/n";


# Record html file and text file:
foreach $entry (@entries) {

   # Display results to screen:
   print("Entry: $entry\n");

   # Print results to text file:
   print TXTFL "$entry\n";

   # Print results to html file:
   print HTMLFL "<a href = \"$selectedDir/$entry\">$entry</a><br>\n";


}


# Close text and html files
close (TXTFL);

print HTMLFL "<BR><BR>\n";
close (HTMLFL);

$hold = <STDIN>;