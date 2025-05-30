#!/usr/bin/perl -w
#
# Program:	createdir.pl
# Creator:	Eric Hepperle
# Date:		06/03/01
#
# Purpose:	Demonstrates creating directories from
#		a name and path the user chooses.
#
#########################################


#----------
# Get this file's name (less path):
#
use File::Basename;
    my $progname = basename($0);


#----------
# Get current working directory:

use Cwd;
    $dir = cwd;


# Remember the original dir.
$homedir = $dir;
chomp $homedir;			# very important!


#----------
# Tell user about this program:
#

print "\n";
print "The name of this file is $progname \n";
print "\n";

print "\n";
print "The full path to this file is: \n";
print "$0 \n";

#----------
# Create header of 40 chars:
# 

print "########################################\n";
print "\n";


#----------
# Make new dir:
#

# Enter location of new dir.
print "Where would you like to create new directory: \n";
$ans = <STDIN>;
$path = $ans;
chomp $path;
print "\n";

# If answer is blank, create newdir in current dir.
if ($ans eq "") {

     $path = $homedir;
     chomp $path;

}

# Enter name of new dir.
print "What will be the name of the new directory? \n";
$newdir = <STDIN>;
print "\n";
chomp $newdir;			# don't forget to chomp!!!

# Tracing:
print "The directory $newdir will be created in \n";
print "$path \n";
print "\n";

# CD to the path to create folder.
chdir "$path";

# Let user know what you did.
print "Just cd'd to $path\n";
print "\n";


# Actually make directory.
mkdir ("$newdir", 0755) or die "Could not make directory newdir: $!";


#----------
$hold = <STDIN>;