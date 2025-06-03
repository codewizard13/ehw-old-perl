#!/usr/bin/perl -w

# Program:		eh_comp2filesnprtdiff_2.pl
# Creator:		Eric Hepperle
# Date:		09/16/01
#
#
#

################################################
# DEFINITIONS:
################################################
#
$hold = ();
#@a = ();
#@b = ();
$hash = ();
$maindir = "c:/windows/desktop/eh_ripped_htmldocs";
$testfile = "$maindir/testlogfile.txt";
$file1 = "$maindir/testfile1.txt";
$file2 = "$maindir/testfile2.txt";
@file1 = ();
@file2 = ();

# Tracing:
print "This is a test\n";
$hold = <STDIN>;

################################################
# Do the test files exist?
################################################
#
if (-e $file1) {

   print "The file $file1 exists\n\n";

} else {

   print "The file $file1 does not exist\n\n";

}

if (-e $file2) {

   print "The file $file2 exist\n\n";

} else {

   print "The file $file2 does not exist\n\n";

}


$hold = <STDIN>;


#################################################
# OPEN THE TEST FILES AND ASSIGN TO ARRAYS:
#################################################
#
open (TEST, ">>$testfile");

   print TEST "Open of test file was successful\n\n";


   unless (open (FILE1, "$file1")) {

      die ("cannot open input file $file1\n");

   }

   print "Successfull opened $file1\n\n";

   close (FILE1);		# IS THIS LINE EVEN NECESSARY?

   @file1 = <FILE1>;

   #---------------------

   unless (open (FILE2, "$file2")) {

      die ("cannot open input file $file2\n");

   }

   print "Successfully opened $file2\n\n";

   @file2 = <FILE2>;

   close (FILE2);		# IS THIS LINE EVEN NECESSARY?


#@a = @file1;
#@b = @file2;

foreach( @file1, @file2 ) {

   $hash{$_}++;

}

# Now you have the hash. Step through the hash, and the values
# that equal 1 only appear in one of the arrays. The rest will have
# a value of 2


print "Here is the output:\n\n";

foreach( keys %hash ) {

   if( $hash{$_} == 1 ) {

      print "$_\n";

      # print differences to the testfile:
      print TEST "$_\n";


   }

}

# The output will be: C D 

close (TEST);

print "Just closed testfile\n";
$hold = <STDIN>;




$hold = <STDIN>;