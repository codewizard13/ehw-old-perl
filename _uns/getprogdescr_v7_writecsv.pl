#!/usr/bin/perl
#
#
# Program:	getprogdescr_v7_writecsv.pl
# Creator:	Eric Hepperle
# Date:	02/10/02
#
# Purpose:	Reads one of my perl files and prints out the description
#		text.  Based on version 5 which works perfectly and makes a
#		text log of each filename and its description.
#
#		This version will write a csv-type file
#		that can be imported into a spreadsheet prog.
#		It will use the double-colon separator.
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01  For AIX.
#
#	EUREEKA !!!!! - 12/28/01
#
#	12/31/01 - Added the "No Description
#		   Available", option.
#
#	02/10/02 - Edited for PC use.	
#		   - Running into a problem converting.
#		     this script will will read
#		     descriptions correctly in one
#		     directory, but not in others
#
###################################################
#
# Planned Improvements:
#
###################################################
#



#------------------------------------------
# PRINT HEADER:
#------------------------------------------
#

print "\n\n";
print "This program is called getprogdescr_v7.pl\n\n";



#------------------------------------------
# DEFINE VARIABLES:
#------------------------------------------
#

# initialize file count var.
$count = 1;

# define directory where perl files reside:
#$perldir = "c:/windows/desktop/ehfiles_1201/eh_perl_my_scripts.dir/eh_perl_dir_011402/perl.misc.dir";
#
# Testing to see if it is the dir that the files are in
#  which is causing the problems:
$perldir = "c:/windows/desktop/perldir.011402";

# define a special output file:
$perlout = "c:/windows/desktop/perlout.dir";

# define description file.
$descriptionfile = "$perlout/descriptionfile.txt";

# define csv file.
$csvfile = "$perlout/csvfile.txt";

# open perl source dir and read all filenames and store in an array.
opendir (PERLDIR, $perldir)|| die "can't opendir $perldir: $!";
   @filenames = readdir(PERLDIR);
closedir (PERLDIR);


# open description log for write.
open (DESCR, ">$descriptionfile");

# open comma-separated-value file for append.
open (CSV, ">$csvfile");


foreach $name (@filenames) {
#
# TRACING:
print "\$name =\t $name\n\n";

   chomp $name;
   #
   # TRACING:
   print "FILE:\t$name\n\n";

   # TRACING:
   print "\n=====================================\n";
   print "STARTING [getdescr] SUBROUTINE:\n";
   print "=====================================\n\n";
   &getdescr;

   # TRACING:
   print "\n=====================================\n";
   print "STARTING [makedescrlog] SUBROUTINE:\n";
   print "=====================================\n\n";
   &makedescrlog;

   # TRACING:
   print "\n=====================================\n";
   print "STARTING [makecsvfile] SUBROUTINE:\n";
   print "=====================================\n\n";
   &makecsvfile;

   $count++;

}


# launch these text files in web browser:
#system("explorer $descriptionfile");
#system("explorer $csvfile");

#----------
#$hold = <STDIN>;
print "\t\t --- END ---\n\n";



#---------------------------------------------
# SUBROUTINES:
#---------------------------------------------
#	


sub getdescr {

  # have to assign full path to read correctly:
  $fullpath = "$perldir/name";
  #
  # TRACING:
  print "FULL PATH:\t [$fullpath]\n\n";
  
  # open the current file for read.
  #
  # TRACING:
  print "CURRENT FILE:\t $name\n\n";
  open (FILE, "$fullpath");
     $file = <FILE>;
  close (FILE);


  $start = "Purpose:";
  $end = "##########";

   # read in whole file, not just one line or paragraph:
   undef $/;

   # Match between "Purpose" and "#######".
   if ($file =~ /$start(.*?)$end/sm) {

      $result = $1;
      #
      # TRACING:
      print "\$result =\t $result\n\n";

   } else {

      $result = "( NO DESCRIPTION AVAILABLE )";

   }

   print "\n\n";
   print "Description:\n\n";
   print $result;
   print "\n";

   print "#----------------------------------------#\n\n";

   $wolb = $result;

   substr($wolb, 0) =~ s/#\s+//g;

   print "WITHOUT THE #:\n\n";
   print "$wolb\n\n";

   print "#----------------------------------------#\n\n";

   $wos = $wolb;

   substr($wos, 0) =~ s/^\s+//g;

   print "WITHOUT SPACES:\n\n";
   print "$wos\n\n";

   print "#----------------------------------------#\n\n";

   $wonl = $wos;

   substr($wonl, 0) =~ s/\.\n/\.  /g;

   substr($wonl, 0) =~ s/\n//g;

   print "WITHOUT NEW LINE CHARS:\n";
   print "(ensures that end of sentence periods are followed by exactly 2 spaces)\n\n";
   print "$wonl\n\n";

   print "#----------------------------------------#\n\n";

}



sub makedescrlog {

   print DESCR "#----------------------------------------#\n\n";
   print DESCR "File Number: $count\n";
   print DESCR "Name: $name\n\n";
   print DESCR "Description:\n";
   print DESCR "$wonl\n\n";


}



sub makecsvfile {

   $sep = "::";

   print CSV "$count$sep$name$sep$wonl\n";

}
