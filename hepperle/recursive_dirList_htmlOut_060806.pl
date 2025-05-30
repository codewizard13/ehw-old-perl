#!/usr/bin/perl
# File howtolistdir.pl created by Eric Hepperle at 14:32:09 on Wed Oct 24 2001. 
#
# Program:        recursive_dirList_htmlOut_060806.pl
# Creator:        Eric Hepperle
# Date:           06/08/06
#
# Purpose:        List contents of a directory in perl, writes output
#                 to a webpage and a text file, both located in the root dir
#
######################################
#
# Edited:  10/08/02  - Writes dir to a webpage and a text file.
#          06/09/06  - Works!

$default_mainDir = "c:/documents and settings/nunya_beezniss/desktop";

# Get user's windows home directory or profile:
$user_profile = `SET userprofile`; # set per variable to system command output
@profile_array = split(/=/, $user_profile);
$mainDir = $profile_array[1]; # get the second element of array
chomp($mainDir); # remove newlines
print "\$mainDir = $mainDir\n\n";
<STDIN>; # press any key to continue

# set mainDir variable
if (-e $default_mainDir)
{
   print "$default_mainDir EXISTS! ...\n\n";
   $outdir = $default_mainDir;
} else {
   print "$default_mainDir DOES NOT EXIST! ...\n";
   print "Using $mainDir instead ...\n\n";
   $outdir = $mainDir;
}
print "\$outdir =\t$outdir\n\n";

# Define output files
print "DEFINING OUTPUT FILES\n\n";
$htmlfile = "$outdir\\desktop\\dirlist.html";
print "\$htmlfile = \t$htmlfile\n\n";
$textfile = "$outdir\\desktop\\dirlist.txt";
print "\$textfile =\t$textfile\n\n";

# set default directory to list out
$ans = "c:/documents and settings/nunya_beezniss/desktop";
GetDirFromUser();

sub GetDirFromUser {
        print "Enter the full path to the directory to list out:\n";
        $ans = <STDIN>;
        chomp $ans;
        print "\n\n";
}

# set selectedDir variable
my($selectedDir) = "$ans";

# process specified directory and subdirs recursively
DoDir($selectedDir);

sub DoDir {
  my($dir) = shift; # gets first value from front of array?
  my($file);
  opendir(DIR, $dir) || die "Unable to open $dir :$!";
  my(@files) = grep {!/^\.\.?$/ } readdir(DIR);

  # initialize counter varibles:
  $counter = 1;
  $dirCount = 0;
  $fileCount = 0;

  closedir(DIR);
  foreach (@files) {

  # tell user what number we're on:
  print "$counter\n\n";

     # if it is a directory:
     if (-d ($file = "$dir\\$_")) {
        $dirCount++;

		# increment counter by one:
        $ttlFileCount = $ttlFileCount + $fileCount;
        print "\t\t\t\t\tTotal Files:\t$ttlFileCount\n";
        sleep(1); # pause for 1 second

		DoDir($file);

        # if it is a file:
        } else {
           $fileCount++;
           print "File #: $fileCount\n\n";

		   # record array of files for later:
           @files_prime = (@files_prime, "$file");

     }
  }
} # END SUB


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


print "Reading: $selectedDir\n\n";
print "Dir Test 2\n\n";


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

print "*** PRESS ANY KEY TO CONTINUE ***\n\n";
$hold = <STDIN>;
