#!/usr/bin/perl
#
# Program:	rdinpt2arry.perl
# Creator:	Eric Hepperle
# Date:		05/18/01
#
# Purpose:	Unless the file open was successful, print an error msg and quit.  Otherwise, print the contents of the file to screen.
#
#################################################


print ("Enter the full path to the file you want to open: \n");

$file1 = <STDIN>;


unless (open (Myfile, "$file1")) {

    die ("cannot open input file $file1\n");

}


@input = <Myfile>;

print (@input);
