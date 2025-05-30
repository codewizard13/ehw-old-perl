#!/usr/bin/perl
# File wrtupcs2stderr.perl created by Eric Hepperle at 14:26:11 on Fri May 18 2001. 
#
# This file takes contents of a file and displays the output
# in all capital letters.
#


print ("Please enter name of file you wish to convert: \n");

$file1 = <STDIN>;


open (MYFILE, "$file1") ||

    die ("Unable to open input file $file1\n");

print STDERR ("File $file1 opened successfully.\n");

$line = <MYFILE>;

while ($line ne "") {

    chop ($line);

    print ("\U$line\E\n");

    $line = <MYFILE>;

}


