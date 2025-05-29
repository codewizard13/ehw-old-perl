#!/usr/bin/perl -wt

# Program:		compare2txtfiles.pl
# Creator:		Eric Hepperle
# Date:		09/16/01

# Step 1: scan file 1, and make an entry in the filelines{} hash array
# for each line of file 1. The whole text of the line is the array
# subscript, or hash key if you prefer. (If you have a choice, use
# the shorter file as file 1, since the memory used for the hash
# array will be proportional to the size of file 1.)

$file1= "C:/WINDOWS/Desktop/EH New Files Post-051301/eh_perl_my_scripts.dir/testfile1.txt";
$file2 = "C:/WINDOWS/Desktop/EH New Files Post-051301/eh_perl_my_scripts.dir/testfile2.txt";


 open(INFILE, "$file1") || die "Failed to read file1: $!\n";

     while (<INFILE>) {

        filelines{$_} = 1;		 # $_ is the line just read from INFILE

      } close(INFILE);

# Now, scan file 2, and print out every line that is found in filelines{}.
# This is basically a string-keyed hash table lookup for each line,
# and ought to be quite fast.
# Note that we have no dependency at all on the ordering of the lines
# in the files, except that duplicate lines will be printed in the
# order that they appear in file 2.


open(INFILE, "file2") || die "Failed to read file2: $!\n";

while (<INFILE>) {

   if (filelines{$_}) {

     print $_;

   }

} close(INFILE);

# Grand total of twelve non-blank, non-comment lines of code...
# and I bet it will compare very favorably with the performance
# of a C-coded routine, let alone any sort of shell script. 
