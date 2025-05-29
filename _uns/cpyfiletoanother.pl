#!/usr/bin/perl
#
# Program:	cpyfiletoanother.pl
# Creator:	Eric Hepperle
# Date:		05/18/01 
#
# Purpose:	This script copies the contents of one file to another instantly.  If the destination file doesn't exist, it creates it. If it can't open the input or output file, it tells you so.  WARNING!  This file will overwrite a file that already exists: UNFORGIVING.
#
#####################################################

print ("Enter the path to the file to copy: \n");

$file2cpy = <STDIN>;

print ("Enter the path to destination file: \n");

$destfile = <STDIN>;


unless (open (INFILE, "$file2cpy")) {

    die ("cannot open input file $file1\n");

}

unless (open (OUTFILE, ">$destfile")) {

    die ("cannot open output file $outfile\n");

}

$line = <INFILE>;

while ($line ne "") {

    print OUTFILE ($line);

    $line = <INFILE>;

}

