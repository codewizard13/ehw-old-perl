#!/usr/bin/perl
# File uncatalogued_eh_diffonlyinlatestfile.pl created by Eric Hepperle at 15:00:45 on Wed Oct  3 2001. 


# This is the way to compare two text files in perl.  Where file2 is the newer of the two files.
# < = file1 and > = file2.
# This file works and has not been cataloged.


# diff file1 file2 | grep "^>"


$file1 = "/afs/rchland.ibm.com/usr3/v2cib484/junk";
$file2 = "/afs/rchland.ibm.com/usr3/v2cib484/junk2";

$diff = `diff $file1 $file2 | grep "^>"`;

print "$diff";

