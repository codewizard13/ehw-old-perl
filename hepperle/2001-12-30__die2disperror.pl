#!/usr/bin/perl
#
# Program:	die2disperror.pl
# Creator:	Eric Hepperle
# Date:		05/18/01
#
# Purpose:	This simple program reads a file to standard output. If filename is incorrect or does not exist, it gives an error.  Demonstrates using error msgs if open is unsuccessful.
#
######################################################




print ("Enter the full path to the file you want to open: \n");

$file1 = <STDIN>;

unless (open (Myfile, "$file1")) {

    die ("cannot open input file $file1\n");
    
}				


# if the program gets this far, the file was
# opened successfully.

$line = <Myfile>;

while ($line ne "") {

    print ($line );

    $line = <Myfile>;

}






