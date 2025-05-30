#!/usr/bin/perl
#
#
# Program:	getprogdescr.pl
# Creator:	Eric Hepperle
# Date:	12/14/01
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
print "This program is called getprogdescr.pl\n\n";

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
     
      # if line is at least number 8, then ...
      if ($count > 7) {

      # first 6 characters.
      $islb = substr("$line", 0, 6);

      # Tracing:
      print "ispounds = $islb\n";

      print "\$count = $count\n\n";

   
         # when first 6 chars = ###### ...
         until ($islb eq "######") {

            # add line to description array.
            @descr = (@descr, $line);

         }

      }

      $count++;

   }



close (FILE);


foreach $el (@descr) {

   print $el;

}
