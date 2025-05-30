#!/usr/bin/perl
# File ehcreatefile.pl.perl created by Eric Hepperle at 08:03:08 on Mon Jun  4 2001. 
#
# Demonstrates how to create a new directory w/ perl.

use Cwd;

   $dir = cwd;

print "You are in the directory $dir \n";
print "\n";

# remember original dir.
$orgdir = $dir;

use File::Basename;

   $fname = basename($0);

print "The name of this file is $fname \n";
print "\n";


#----------


print "Enter the path where you want new dir created: \n";

$path = <STDIN>;
chomp $path;

print "\n";


print "Enter the name of the dir you want to create: \n";

$newdir = <STDIN>;
chomp $newdir;

print "\n";

# create a var to hold $path/$newdir.
$fullpath = "$path/$newdir";


# make directory and give everyone access.
mkdir ($fullpath, 0777) || die "Problem creating directory\n";

print "Just created dir $newdir in path \n";
print "$path \n";
print "\n";


# create a count file to keep track of count.
$countfile = "~v2cib484/tmp/ehcreatefile.count.txt";

if (! -e $countfile) {

     open (CF, ">$countfile");

     print "This is the count file:\n";

     close (CF);

}


# open a newfile for writing if it doesn't already exist.
#if (-e $newfile)















#----------
$hold = <STDIN>;
