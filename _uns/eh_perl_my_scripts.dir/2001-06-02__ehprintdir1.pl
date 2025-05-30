#!/usr/bin/perl -w
#
# This file will list out the contents of any directory and
# print them to the screen.
#


print "\n";

print "Enter a directory path: ";

$dirpath = <STDIN>;

opendir(DIR, $dirpath);

@filelist = glob("*.*");
print (@filelist);
closedir(DIR);

print "\n";


#----------
$hold = <STDIN>;