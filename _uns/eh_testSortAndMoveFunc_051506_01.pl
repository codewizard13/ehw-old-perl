#!/usr/bin/perl
#
# Program:    eh_testSortAndMoveFunc_051506_01.pl
# Creator:    Eric Hepperle
# Date:       05/15/06
#
# Purpose:    Since I was having trouble getting my
#             "sort_and_move_files" function/subroutine
#             to work properly, I created this program
#             to test and revise said subroutine.
#
# Requires:   * Source dir must exist as defined or you
#             must create it for program to work.
#
#             * Destination dir must exist.
#
#             * Test files must exist or you can create
#             text files and rename accordingly.
#
#             * Subdirs "audio", "video", "pix", & "docs"
#             must exist in the destination dir.
#
############################################################

use File::Copy;

# DEFINE TEST VARIABLES:
$source_dir = "F:/sortAndMoveSource";
$dest_dir = "F:/sortAndMoveDest";
$file1 = "fuck.you.and.your.mother.too.avi";
$file2 = "how is the weather in france!!.txt";
$file3 = "eat pussy all night 000456 - 01.45678.zip";
$file4 = "Jive Turkeyz - pump, pump, pump it up!! ft. lil' swift.mp3";

# store file paths in array for easier processing
@files = ($file1, $file2, $file3, $file4);

# test subroutine:
#
# TRACING:
print "Running [sort_and_move_files] now ................\n\n";
&sort_and_move_files(@files);

$pause = <STDIN>;


##########################
###### SUBROUTINES: ######
##########################

# sort and move files by extension
# (NOTE: Don't forget to use "eq" not "="
#    when comparing strings.)
sub sort_and_move_files {

   # Arguments passed should be files to process;
   #    store them in an array.
   my (@files) = @_;

   print "\n\n";
   
   foreach $file (@files) {
      
      # get this file's extension.
      $file_ext = &get_ext($file);
      #
      # TRACING: Display variable values
      print "\tFilename: $file\n";
      print "\tExtension: $file_ext\n\n";
      
      if ($file_ext eq "avi") {
         print "Moving [$source_dir/$file] to  [$dest_dir/video/$file] ...\n\n";
         move("$source_dir/$file", "$dest_dir/video/$file");
      }
      if ($file_ext eq "jpg") {
         print "Moving [$source_dir/$file] to  [$dest_dir/pix/$file] ...\n\n";
         move("$source_dir/$file", "$dest_dir/pix/$file");
      }
      if ($file_ext eq "txt") {
         print "Moving [$source_dir/$file] to  [$dest_dir/docs/$file] ...\n\n";
         move("$source_dir/$file", "$dest_dir/docs/$file");
      }
      if ($file_ext eq "mp3") {
         print "Moving [$source_dir/$file] to  [$dest_dir/audio/$file] ...\n\n";
         move("$source_dir/$file", "$dest_dir/audio/$file");
      }
      
      # reset file extension
      $file_ext eq "";
 
   }
}


# Gets file extension by parsing
#    (Takes 1 filename argument.)
#
sub get_ext {
   # get filename argument.
   # (NOTE: parens are required around the variable
   #    preceded by 'my', or a number will be returned
   #    instead of the filename.)
   my ($file_name) = @_;
   
   # TRACING: Display the value of filename passed.
   print "\t\n\n\$file_name = $file_name\n\n\n";
   
   # split filename
   # (NOTE: to separate by a "." you must use "\.";
   #     the period has to be escaped or it won't work.)
   @filename_parts = split(/\./, $file_name);

   # TRACING: Display array length
   $array_length = $#filename_parts;
   print "Length of array = $array_length\n\n";
   # CAUTION!: I have a feeling this could be a problem later on.
   print "Number of elements in array = ", $array_length + 1, "\n\n";
   
   # Get last element of array
   $last_element = $filename_parts[$array_length];
   # TRACING: Display the last element of the array
   print "\t\$last_element = $last_element\n\n";
   
   # define extension
   $ext = $last_element;
}
