#!/usr/bin/perl
# File die2disperror.perl created by Eric Hepperle at 09:51:02 on Fri May 18 2001. 
#
# This simple program opens reads a file to standard output.
# If filename is incorrect or does not exist, it gives
# an error




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






