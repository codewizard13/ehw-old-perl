#!/usr/bin/perl
#
#
# Program:	getprogdescr_v6_writecsv.pl
# Creator:	Eric Hepperle
# Date:		12/31/01
#
# Purpose:	Reads one of my perl files and prints out the description text.
#		Based on version 5 which works perfectly and makes a text log of each filename and its description.
#
#		This version will write a csv-type file
#		that can be imported into a spreadsheet prog.
#		It will use the double-colon separator.
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
#
#	EUREEKA !!!!! - 12/28/01
#
#	12/31/01 - Added the "No Description
#		   Available", option.

#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called getprogdescr_v6.pl\n\n";

#------------------------------------------
# DEFINE VARIABLES:
#------------------------------------------
#

# initialize file count var.
$count = 1;

# define perl files directory.
#$perldir = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir";
#$perldir = "c:/windows/desktop/all_perl";
$perldir = "c:/windows/desktop/EHFILES_1201/eh_perl_my_scripts.dir/eh_perl_dir_011402/perl.work.dir";

# define a special output file:
$perlout = "c:/windows/desktop/perlout.dir";

# define description file.
$descriptionfile = "$perlout/descriptionfile.txt";

# define csv file.
#$csvfile = "$perldir/csvfile.csv";
$csvfile = "$perlout/csvfile.txt";


opendir (PERLDIR, $perldir)|| die "can't opendir $perldir: $!";
   @filenames = readdir(PERLDIR);
closedir (PERLDIR);


# open description log for write.
open (DESCR, ">$descriptionfile");

# open comma-separated-value file for write.
open (CSV, ">$csvfile");


foreach $name (@filenames) {

   chomp $name;
   print "FILE:\t$name\n\n";

   &getdescr;
   &makedescrlog;
   &makecsvfile;

   $count++;

}

system("explorer $descriptionfile");
system("explorer $csvfile");


#----------
$hold = <STDIN>;

#---------------------------------------------
# SUBROUTINES:
#---------------------------------------------
#	


sub getdescr {

  # open the current file for read.
  #
  # TRACING:
  print "CURRENT FILE:\t $name\n\n";
  $hold = <STDIN>;
  open (FILE, "$name");
     $file = <FILE>;
  close (FILE);


  $start = "Purpose:";
   $end = "##########";

   undef $/;           # read in whole file, not just one line or paragraph

   # Match between "Purpose" and "#######".
   if ($file =~ /$start(.*?)$end/sm) {

      $result = $1;

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

#   substr($wonl, 0) =~ s/\.\n/\.  /g;

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
