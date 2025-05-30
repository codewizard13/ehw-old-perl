#!/usr/bin/perl -w
#
# This file will list out the contents of any directory and
# print them to the screen.
#


########################################
# INITIALIZE VARIABLES:
########################################
#

# use CWD;

$dirpath = ();
$el = ();
$hold = ();
$tempdirlog = "c:/Documents and Settings/Nunya_beezniss/desktop/eh_tempdirlog.html";


########################################




print "\n";
print "Enter a directory path to list out: \n\n";
$dirpath = <STDIN>;
chomp $dirpath;

$tempdirlog = "$dirpath/eh_tempdirlog.html";
print "TEMPDIRLOG = 

# Open the directory to read:
opendir(DIR, $dirpath);

print "The directory path $dirpath, has been successfully opened!\n\n";
$hold = <STDIN>;

# Open the log file to write the list to:
open (LOG, ">$tempdirlog");

   print "\n";

   # take time reading:
   $time = localtime;
  
   print LOG "<FONT COLOR = FORESTGREEN >Time:</FONT>\n";
   print LOG "<FONT COLOR = PURPLE >$time</FONT><BR>\n";
   print LOG "Directory Listing of: <FONT COLOR = PURPLE>";
   print LOG "<A HREF = \"$dirpath\">$dirpath</A></FONT><BR>\n";
   print LOG "============================================ <BR><BR>\n\n";


   # read 'everything' (glob) in the dir into array:
   @filelist = glob("*.*");

   foreach $el (@filelist) {

      print "$el\n";

      print LOG "<FONT COLOR = BLUE>$el</FONT><BR>\n"; 

   }

close (LOG);

closedir(DIR);


print "\n";



#----------

print "End of Operation ...";
$hold = <STDIN>;