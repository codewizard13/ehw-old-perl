#!/usr/bin/perl
#
# Program:	getprogdescr_v8.pl
# Creator:	Eric Hepperle
# Date:	02/10/02
#
# Purpose:	Gets descriptions from all perl files in a given directory
#		and writes them to a description text file.
#		This version was written from scratch for the PC due to
#		unforseen problems converting the AIX version for
#		Windows use.
#
#		(Windows Version).
#
#		!!! WORKS !!! -- Do not modify further !
#
######################################################
#
######################################################
#


######################################################
# DEFINE/INITIALIZE VARIABLES:
######################################################
#

# initialize file count variable to 1.
$count = 1;
print "\$count =\t $count\n\n";

# define directory where perl files reside.
$perldir = "c:/windows/desktop";
#$perldir = "c:/windows/desktop/EHFILES_1201/eh_perl_my_scripts.dir/eh_perl_dir_011402/perl.work.dir";
#$perldir = "c:/windows/desktop/ehfiles_1201/eh_perl_my_scripts.dir";

print "\$perldir =\t $perldir\n\n";


# define output directory.
$outdir = "c:/windows/desktop/perlout.dir";
print "\$outdir =\t $outdir\n\n";

# define description output file.
$descrfile = "$outdir/descriptionfile.txt";
print "\$descrfile =\t $descrfile\n\n";

# define csv output file.
$csvfile = "$outdir/csvfile.txt";
print "\$csvfile =\t $csvfile\n\n";



#----------------------------------------------------#
# Open description and csv files and keep open until
# finished writing -- then make sure to close both.
#----------------------------------------------------#
#
# open description file for append.
open (DESCR, ">>$descrfile") || die ("Can't open file: [$descrfile]: $!");

# open csv file for write.
open (CSV, ">>$csvfile") || die ("Can't open file: [$csvfile]: $!");


#-----------------------------------------------------#
# GET PERL DIR PATH FROM USER (OPTIONAL):
#-----------------------------------------------------#
#
print "Enter path to the directory where the perl files are:\n\n";
$input = <STDIN>;
#
# remove newline char.
chomp $input;
#
if ($input ne "") {
   $perldir = $input;
   #
   # TRACING:
   print "\$perldir = input =\t $perldir\n\n";
} else {
   print "\$perldir = \$perldir =\t $perldir\n\n";
}
   



#-----------------------------------------------------#
# Open directory where perl files reside (or give
# error msg) and read them all into an array, then
# close directory.
#-----------------------------------------------------#
#
opendir (SOURCEDIR, $perldir) || die ("Can't open dir: [$perldir]: $!");
   @justnames = readdir(SOURCEDIR);
close (SOURCEDIR);
#
# TRACING:
#    - Read all lines in @justnames to screen:
#
foreach $line (@justnames) {
   print "LINE [$count]:\t $line\n";
   
   # increment count variable by 1.
   $count++;
}




# --- WORKS TO HERE --- #


#----------------------------------------------------#
# Retrieve descriptions from each file in @justnames
# and write file data to description and csv files:
#----------------------------------------------------#
#
&getdescr;



#----- KEEP ACTIVE PERL WINDOW OPEN -----#
# $hold = <STDIN>;



######################################################
# SUBROUTINES:
######################################################
#

#----------------------------------------------------#
# Suck descriptions from perl files:
#----------------------------------------------------#
#
   sub getdescr {

      # Reset count var to 1:
      $count = 1;

      # Read each filename from @justnames.
      foreach $name (@justnames) {

         # TRACING:
         # print "\$name =\t $name\n";

         # create full path for each file.
         $fullpath = "$perldir/$name";
         #
         # TRACING:
         # print "fullpath:\n";
         # print "$fullpath\n\n";



         # Open current file, store in a array
         # variable, and then close file.
         #
         # - Don't confuse the scalar storing
         #   the file contents with the scalar
         #   storing the filename.
         #
         open (FILE, "$fullpath");
 
            # STORE ENTIRE FILE IN SCALAR VAR,
            # and IGNORE new line characters.
            #
            undef $/;

            # $file will store the contents of the file.
            $file = <FILE>;

         close
         #
         # TRACING:
         print "FILENAME:\t [$fullpath]\n";
         print "==============================\n";
         # print "FILE CONTENTS:\n\n";
         # print "$file\n\n";

         # define start and end variables for use in search:
         $start = "Purpose:";
         $end = "##########";
         
         # VERY IMPORTANT !!! -->
         # Search beyond newline characters.
         undef $/;

         # MATCH BETWEEN START AND END VARIABLES:
         if ($file =~ /$start(.*?)$end/sm) {

            $result = $1;
            #
            # TRACING:
            print "\$result =\t $result\n\n";

        # Otherwise.
        } else {

           $result = "(NO DESCRIPTION AVAILABLE)";

        }         



       #------------------------------------------#
       # Convert result by removing spaces, new lines, etc:
       #------------------------------------------#
       #
       # Copy $result to a scalar var for manipulation
       $wolb = $result;
       #
       # Remove "#" signs from description:
       substr($wolb, 0) =~ s/#\s+//g;
       # Remove spaces from beginning of lines:
       substr($wolb, 0) =~ s/^\s+//g;
       # Replace periods followed by new line chars
       #    with ".  ":
       substr($wolb, 0) =~ s/\.\n/\.  /g;
       # Remove any remaining new line chars:
       substr($wolb, 0) =~ s/\n//g;
       #
       # TRACING:
       # print DESCR "NEW RESULT:\n";
       # print DESCR "=================================\n";
       # print DESCR "$wolb\n\n";

       # --- WORKS TO HERE --- #

       #----------------------------------------------------#
       # Write descriptions to description Log:
       #----------------------------------------------------#
       #
       &makedescrlog;

       #----------------------------------------------------#
       # Make CSV file with double colon as delimiter.  We
       # can then import this file into Excel and it will
       # autoformat:
       #----------------------------------------------------#
       #
       &makecsvfile;


       
     # increment count var by 1.
     $count++;

     } # end foreach read loop.

   } # end sub



#----------------------------------------------------#
# Make description Log:
#----------------------------------------------------#
#
   sub makedescrlog {

      print DESCR "#----------------------------------------#\n";
      print DESCR "File Number: $count\n";
      print DESCR "Name: $name\n\n";
      print DESCR "Description:\n";
      print DESCR "$wolb\n\n\n";

   } # end sub



#----------------------------------------------------#
# Make CSV file:
#----------------------------------------------------#
#
   sub makecsvfile {

      # define delimiter as two colons.
      $sep = "::";

      # write/format data to csv file.
      print CSV "$count$sep$name$sep$perldir$sep$wolb\n";

   } # end sub



