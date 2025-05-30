#!/usr/bin/perl
#
#
# Program:	prtallfilesindir.pl
# Creator:	Eric Hepperle
# Date:		01/23/02
#
# Purpose:	Parses a specified directory into 2 separate lists; one of subdirs and one of files.  Then creates a report that automatically outputs to printer, and finally, prints all files in the specified directory.  Uses sleep for timing so the printer doesn't get hit too hard by the program.
#
###################################################
#
# Revisions:
#
#	- Original:  01/23/02
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called prtallfilesindir.pl\n\n";

# define main dir.
$maindir = "/afs/rchland.ibm.com/usr3/v2cib484";

print "Enter the target directory:\n\n";
$tdir = <STDIN>;
chomp$ tdir;
print "\n";

# verify directory.
print "TARGET DIRECTORY:\t $tdir\n\n";

&checkifdir;

&printfilesonly;


#################################################################
# SUBDIRECTORIES:
#################################################################
#

sub checkifdir {

   # define directory array.
   @dirarray = ();

   # define file array.
   @filearray = ();

   # open the target directory.
   opendir(TDIR, $tdir) || die "could not open dir $tdir : $!";

      # read file contents of directory, and store in array.
      @contents = readdir(TDIR);
   

      # read each entry and if not directory, print file.
      foreach $item (@contents) {

         $itemnpath = "$tdir/$item";

         if (-d $itemnpath) {

            @dirarray = (@dirarray, $item);

         } else {

            # print "* $item is a file ...\n\n";

            @filearray = (@filearray, $item);

         } 


      }
   
   closedir(TDIR);


   # define output file.
   $outfile = "$maindir/tmp/dirsnfiles.ez";

   # Write results to a temp file.
   open (OUT, ">$outfile");

      print OUT "FILES:\n";
      print OUT "=================================\n\n";
      foreach $file (@filearray) {
         print OUT " * $file\n";
      }
      print OUT "\n\n";


      print OUT "DIRECTORIES:\n";
      print OUT "=================================\n\n";
      foreach $subdir (@dirarray) {
         print OUT " ~ $subdir\n";
      }
      print OUT "\n\n";

   close (OUT);


   # send file to printer.
   $printfile = `cat $outfile | pr | lpr`;

   $printfile;

}



sub printfilesonly {

   foreach $file (@filearray) {

      $filenpath = "$tdir/$file";

      print "Printing file: $file ...\n\n";

      $printfile = `cat $filenpath | pr | lpr`;

      $printfile;

      # wait 10 seconds before sending the next file.
      sleep(10);

   }

}
