#!/usr/bin/perl

# Program:	getdirsize.pl
# Creator:	Eric Hepperle
# Date:	03/20/02
#
# Purpose:	Prints the sizes of dos directories.

use Cwd;

$dir = cwd;

print "\n\n";
print "This file is called $0\n\n";

# get directory from user.
print "ENTER DIRECTORY NAME:\n\n";
$dirname = <STDIN>;
chomp $dirname;
print "\n";

# change dir to what use entered.
chdir($dirname);

$dir = cwd;
print "CURRENT DIR:\n";
print "$dir\n\n";

$hold = <STDIN>;

# assign dos dir command to a var.
@dosdir = system(dir);

@dosdir;

# set count value.
$count = 1;


# DEFINE TEMP FILE:
$tempfile = "c:/ehdostempfile.txt";

open (TEMPFILE, ">$tempfile");

# count all lines in @dosdir.
foreach $line (@dosdir) {

   # remove new line char.
   chomp $line;

   # print line for verification.
   print "line [$count]:\t$line\n\n";

   print TEMPFILE "$line\n";;


   # increment count value.
   $count++;

}
print "\n";

print "FINAL COUNT VALUE:\t$count\n\n";


close (TEMPFILE);



#       !!!!!!!!! DOESN'T WORK YET because I can't figure the system function.







#----------
$hold = <STDIN>;