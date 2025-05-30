#!/usr/bin/perl -w
#
# Program:	ehprintdir2.pl
# Creator:	Eric Hepperle
# Date:		06/03/01 
#
# Purpose:	This file will list out the contents of any directory
#		and print them to the screen, one element per line.
#		It also advises the user on what directory it
#		is in at any given moment.
#
#------------------------------
#
# BUGS:
# =====
#
# (FIXED:) I can now print a list of files in a directory,
# but I cannot choose the directory I want to list.
#
###############################


#----------
# Explain to user what this prog does:
#

print "########################################\n";
# print a 40 char. header line.

print "\n";


#----------
# Tell user the name and full path to this file:

use File::Basename;
    my $progname = basename($0);


#----------
# Tell user what directory they are in now:

use Cwd;
    $dir = cwd;


#----------
# Store name of current dir in a temp var:

$orghomedir = $dir;


# Tracing:
print "The home directory is: \n";
print "$orghomedir \n";
print "\n";

print "You are currently in the following directory: \n";
print "$dir \n";
print "\n";

print "This program's name is $progname \n";
print "\n";
print "The full path to this file from here is: \n";
print "$0 \n";
print "\n";
print "This program allows user to enter a path to a directory\n";
print "and then it lists out all the files within. It does not\n";
print "list folders.\n";
print "\n";
print "#---------------------------------------\n";
print "\n";


#----------
# Create array containing names of all files
# in the specified directory:
#

print "\n";

print "Enter a directory path: ";

$dirpath = <STDIN>;
chomp $dirpath;


#----------
# You have to be in root dir (C:) to be able to change to any
# dir of that level or lower. Thus we must cd to c: before
# we can proceed.

chdir "C";

$dir = cwd;
print "WE HAVE JUST CD'D TO THE ROOT DIR \n";
print "\n";

chdir $dirpath;			# change working directory.

@filelist = glob("*.*");	# list all entries (like dir /b).

push (@filelist, "Junk");	# add a filler value for
				# element zero.
chomp (@filelist);		# clean return chars off end.

print "\n";

print "The number of files in the directory is: $#filelist \n";
print "\n";

# Tracing:
print "\$dirpath = $dirpath \n";
print "\n";


#----------
# Calculate length of array and print each
# element on a separate line:
#

$count = 1;
print "\$count = $count\n";
print "\n";

#print (@filelist);

while ($count <= $#filelist) {

     print ("element $count is: $filelist[$count - 1]\n");

     $count++;

#     print "\$count = $count\n";

}

print "\n";


#----------
# Print the number of elements in the array
# "@filelist":
#

print "\n";
print "The number of elements in the list is: $#filelist \n";
print "\n";


#----------
$hold = <STDIN>;