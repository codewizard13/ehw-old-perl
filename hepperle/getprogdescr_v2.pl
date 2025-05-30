#!/usr/bin/perl
#
#
# Program:	getprogdescr_v2.pl
# Creator:	Eric Hepperle
# Date:		12/14/01
#
# Purpose:	Reads one of my perl files and prints out the description text.
#
###################################################
#
# Revisions:
#
#	- Original:  12/14/01
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
print "This program is called getprogdescr_v2.pl\n\n";

# initialize count variable.
$count = 1;

# have user enter the name of the file to search.
print "Enter the filename (full path): \n";
$file = <STDIN>;
chomp $file;

# Tracing:
print "\nFilename:  $file\n\n";

# open file for read.
open (FILE, "$file");

   # store file contents in an array.
   @fileary = <FILE>;

   # read every line.
   foreach $line (@fileary) {

      # remove new line char.
      chomp $line;

      # If the line contains the string "Purpose"...
#      if ($line =~ /Purpose/) {

         # Until line contains 10 pounds (delimiter)...
#         until ($line !~ /##########/) {

           

#	 }


#         print "\$line\n";
#         print " contains the word Purpose ...\n\n\n";

#      } else {

#         print "\$line\n";
#         print "does not contain the word Purpose ...\n\n\n";

#      }


            # make line array.
            @array = (@array, $line);

            # Tracing:
            print "array = \n";
            print "\$line # $count\n";




      $count++;

   }


close (FILE);
