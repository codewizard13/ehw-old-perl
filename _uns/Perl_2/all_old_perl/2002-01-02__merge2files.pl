#!/usr/bin/perl
#
# Program:	merge2files.pl
# Creator:	Eric Hepperle
# Date:		05/18/01
#
# Purpose:	This file takes the contents of file1 and file2 and merges them vertically; prints a line of 1 then corresponding line of 2; then the next line and so on.
#
######################################################


print ("Enter the name of the first file to merge: \n");

$testfile1 = <STDIN>;

print ("Enter the name of the second file to merge: \n");

$testfile2 = <STDIN>;


open (INFILE1, "$testfile1") ||

    die ("Cannot open input file $testfile1\n");

open (INFILE2, "$testfile2") ||

    die ("Cannot open input file $testfile2\n");

$line1 = <INFILE1>;

$line2 = <INFILE2>;

while ($line ne "" || $line2 ne "") {

    if ($line1 ne "") {

	print ($line1);

	$line1 = <INFILE1>;

    }

    if ($line2 ne "") {

	print ($line2);

	$line2 = <INFILE2>;

    }

}

