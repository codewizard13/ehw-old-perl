#!/usr/bin/perl
#
# Program:	makeonedoc.pl
# Creator:	Eric Hepperle
# Date:	01/07/02
#
# Purpose:	Takes a bunch of text files and concats them into one.
#
##################################################3

print "\n\n";

print "(Press any key to BEGIN:)\n\n";
$begin = <STDIN>;

# set default dir.
$dir = $defdir = "c:/windows/desktop/kbook_record.dir";

# set final file name.
$finfile = "c:/windows/desktop/onefile.doc";

# open the chosen directory.
opendir(DIR, "$dir");

   # make an array of all file names.
   @files = readdir(DIR);

   # open final file for concat.
   open (FIN, ">>$finfile");

   foreach $file (@files) {

      chomp $file;

      print "FILENAME:\t$file\n\n";

      $path = "$dir/$file";

      # read contents of the file into an array.
      open (FILE, "$path");
         @contents = <FILE>;
      close (FILE);

      print FIN "@contents\n";

   }

   close (FIN);

close (DIR);


print "PRESS ANY KEY TO QUIT.";
$hold = <STDIN>;
