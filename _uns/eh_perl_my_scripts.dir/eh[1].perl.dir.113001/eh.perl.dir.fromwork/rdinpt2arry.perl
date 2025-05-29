#!/usr/bin/perl
# File rdinpt2arry.perl created by Eric Hepperle at 11:26:57 on Fri May 18 2001. 
#
# I am not sure of the usefulness of this script.
#

print ("Enter the full path to the file you want to open: \n");

$file1 = <STDIN>;


unless (open (Myfile, "$file1")) {

    die ("cannot open input file $file1\n");

}

@input = <Myfile>;

print (@input);
