#!/usr/bin/perl
#
#
# Program:	getprogdescr_v5.pl
# Creator:	Eric Hepperle
# Date:		12/28/01
#
# Purpose:	Reads one of my perl files and prints out the description text.
#		Based on version 4 which works.  This version uses a foreach loop to read every file in the list
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
#
#	EUREEKA !!!!! - 12/28/01

#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called getprogdescr_v5.pl\n\n";

#------------------------------------------
# DEFINE VARIABLES:
#------------------------------------------
#

# initialize file count var.
$count = 1;

# define perl files directory.
#$perldir = "/afs/rchland.ibm.com/usr3/v2cib484/eh.perl.dir";
#
# 02/10/02 - Added this line for PC use:
$perldir = "c:/windows/desktop/ehfiles_1201/eh_perl_dir_011402/perl.web.dir";


# define description file.
$descriptionfile = "$perldir/descriptionfile.txt";


opendir (PERLDIR, $perldir)|| die "can't opendir $perldir: $!";
   @filenames = readdir(PERLDIR);
closedir (PERLDIR);


# open description log for append.
open (DESCR, ">>$descriptionfile");


foreach $name (@filenames) {

   chomp $name;
   print "FILE:\t$name\n\n";

   &getdescr;
   &makedescrlog;

   $count++;

}

#system("netscape $descriptionfile");

$hold = <STDIN>;

#---------------------------------------------
# SUBROUTINES:
#---------------------------------------------
#	


sub getdescr {

  $fullname = "$perldir/$name"

  # open the current file for read.
  open (FILE, "$name");
     $file = <FILE>;
  close (FILE);


  $start = "Purpose:";
   $end = "##########";

   undef $/;           # read in whole file, not just one line or paragraph

   # Match between "Purpose" and "#######".
   if ($file =~ /$start(.*?)$end/sm) {

      $result = $1;

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
