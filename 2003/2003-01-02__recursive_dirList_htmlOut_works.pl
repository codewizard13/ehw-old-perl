#!/usr/bin/perl
# File howtolistdir.pl created by Eric Hepperle at 14:32:09 on Wed Oct 24 2001. 
#
# Program:	recursive_dirList_htmlOut.pl
# Creator:	Eric Hepperle
# Date:		11/02/02
#
# Purpose:	Simple demonstration of how to list the contents of a directory in perl.
#
######################################3
#
# Edited:	10/08/02	- Writes dir to a webpage and a text file.


$maindir = "c:/documents and settings/nunya_beezniss/desktop";
$htmlfile = "$maindir/dirlist.html";
$textfile = "$maindir/dirlist.txt";



$ans = "c:/documents and settings/nunya_beezniss/desktop";
GetDirFromUser();

sub GetDirFromUser {
	print "Enter the directory to list out:  \n";
	$ans = <STDIN>;
	chomp $ans;
	print "\n\n";
}

#my($root) = "C:\\users";
my($selectedDir) = "$ans";
DoDir($selectedDir);


sub DoDir {
  my($dir) = shift;
  my($file);
  opendir(DIR, $dir) || die "Unable to open $dir :$!";
  my(@files) = grep {!/^\.\.?$/ } readdir(DIR);

  # initialize a counter varibles:
  $counter = 1;
  $dirCount = 0;
  $fileCount = 0;

  closedir(DIR);
  foreach (@files) {

  # tell user what number we're on:
  print "$counter\n\n";

	 # if it is a directory:
     if (-d ($file = "$dir\\$_")) {
#			$subDir = $file;
#          print "Found a directory: $file\n";
			 $dirCount++;

		 	 # increment counter by one:
			$ttlFileCount = $ttlFileCount + $fileCount;
			print "\t\t\t\t\tTotal Files:\t$ttlFileCount\n";
			sleep(1);
#			 print "Directory #: $dirCount\t$subDir\n\n";
          DoDir($file);

	 # if it is a file:
     } else {
#          print "File $file\n";
		  $fileCount++;
		  print "File #: $fileCount\n\n";
		  # record array of files for later:
          @files_prime = (@files_prime, "$file");

	

     }
  }
}


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
foreach $entry (@files_prime) {

   # Display results to screen:
#   print("Entry: $entry\n");

   # Print results to text file:
   print TXTFL "$entry\n";

   # Print results to html file:
   print HTMLFL "<a href = \"$entry\">$entry</a><br>\n";


}


# Close text and html files
close (TXTFL);

print HTMLFL "<BR><BR>\n";
close (HTMLFL);

$hold = <STDIN>;