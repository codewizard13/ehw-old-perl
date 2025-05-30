#!/usr/bin/perl
# File rdinpt2arry.perl created by Eric Hepperle at 11:26:57 on Fri May 18 2001. 
#
# This script copies the contents of one file to another instantly.
# If the destination file doesn't exist, it creates it.
# If it can't open the input or output file, it tells you so.
#

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

