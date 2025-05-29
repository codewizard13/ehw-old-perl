#!/usr/bin/perl
#
# Program:	chkifflexists.pl
# Creator:	Eric Hepperle
# Date:		05/18/01 
#
# Purpose:	This program checks to see if an opened file actually exists.  If yes, it displays the contents of the file to stdout in all UPPER CASE.
#
###################################################

print ("Enter the name of the file you want to search for: \n");

$file1 = <STDIN>;



unless (open (MYFILE, "$file1")) {

    if (-e "$file1") {

	die ("File $file1 exists, but cannot be opened.\n");

    } else {

        die ("File $file1 does not exist\n");

    }

}

$line = <MYFILE>;

while ($line ne "") {

    chop ($line);

    print ("\U$line\E\n");

    $line = <MYFILE>;

}

