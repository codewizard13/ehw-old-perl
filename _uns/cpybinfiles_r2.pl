#!/usr/bin/perl -w
#
# Program:	cpybinfiles_r2.pl
# Creator:	Eric Hepperle
# Date:		06/03/01
#
# Purpose:	Makes duplicates of binary files and puts
#		them in a new folder.
#
# Revisions:	06/03/01
#		- Can create a text file in the temp dir and
#		  write to it.  Will work on binaries tomorrow.
#
#		06/04/01
#		- Added code to create a countfiledir folder
#		  one level under root, and create a count
#		  file in it and write a number to it.
#
#		- Added code to create a do_not_delet_this_folder.txt
#		  file in the countfiledir.
#
#		- Added code to let user choose name of
#		  newdir to create.
#
#		- Having trouble getting the code right
#		  for reading the count file as a 1 element
#		  array.
#
#########################################

print "\n";

#****************************************#
#*** Create New Folder for Duplicates: **#
#****************************************#
#


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
# Create a count file for program:
#

# define countdir to a variable.
#
# NOTE: This is THE countdir and will have
# the same location one level under root
# for all files.
#
$countdir = "C:/perl_countfiles";
chomp $countdir;

# if countfiles dir doesn't exist, create it.
if (! -e $countdir) {

     print "The directory $countdir does not exist.\n";
     
     mkdir ($countdir, 0777) || die "The directory C:/perl_countfiles could not be created: $!";

     print "Hooray! ... The directory $countdir was successfully created!\n";
     print "\n";

} else {

     print "The directory $countdir does exist.\n";
     print "\n";


}

# create caveat file in countdir.

        open (CAVEAT, ">C:/perl_countfiles/do_not_delete_this_folder.txt");
        print CAVEAT "DO NOT DELETE THIS FOLDER!";
        close (CAVEAT);

# define the path of countfile to variable.
$countfile = "C:/perl_countfiles/$progname\_count.txt";
#
# NOTE: The syntax "sometext\othertext" is used to append
# the othertext portion to the the sometext part; especially
# usefull when creating multiple files with the same
# prefix or suffix, and for appending an underscore
# ('_'), to a variable name. The '\' is the actual appending
# operator.
#
chomp $countfile;

# Tracing:
print "The name of the countfile will be: \n";
print "$countfile \n";
print "\n";

# actually make count file if it doesn't exist,
# otherwise, open the file in append mode.
#
open (COUNTFL, ">>$countfile") || die "cannot open: $!\n";;
print COUNTFL "1\n";		# DON'T forget to use handle in print
				# statement, to print to a file
close (COUNTFL);


#----------
# Ask user what to call new dir:
#
print "What will be the name of the new directory? ";
$newdir = <STDIN>;
chomp $newdir;

# if answer is blank, then newdir is based on count.
# i.e.: newdir = "newdir\$count"

# set a file variable equal to a file:

print "\n";

unless (open (COUNTFL, "$countfile")) {

     die ("cannot open $file1\n");

     $hold = <STDIN>;

}

# If the prog. gets this far, then open was successful
#

$line = <COUNTFL>;

while ($line ne "") {

     print "\$line = $line\n";

     $line = <COUNTFL>;

     $count = $line;	 	# give count var better name.

     print "The value of \$count is now $count\n";
     print "\n";

}



#----------
# Make new dir:
#

print "\n";

$dirpath = "C:/windows/desktop/$newdir";
print "\n";
chomp $dirpath;			# don't forget to chomp!!!

print "\n";

# Actually make directory.

if (! -e $dirpath) {

     print "The folder $dirpath does not exist ...\n";
     print "\n";     

     mkdir ("$dirpath", 0755) or die "Could not make directory newdir: $!";

     # Tell user the folder was created, ( Right now I
     # am not checking to see if this is true, but
     # I will have to implement that code later and it
     # will probably go here).
     #
     print "The directory $dirpath was created successfully.\n";
     print "\n";

} else {

     print "The folder $dirpath already exists ...\n";
     print "\n";

     print "Proceeding with the rest of the program ...\n";
     print "\n";

}


#****************************************#
#***** Make Duplicates of binaries: *****#
#****************************************#
#



opendir(NT,"$dirpath") || die "Cannot opendir $dirpath: $!";

unless (open (FILE,">c:/windows/desktop/temp_dir/ehtxtfile.02.txt")) {
        print "Sorry, I couldn't create c:/windows/desktop/temp_dir/ehtxtfile.01";
}
        
print FILE "Here is one line of text\n";
print FILE "\n";
print FILE "This is a 2nd line of text, \n";
print FILE "Written by: Eric Hepperle.\n";
print FILE "\n";

close (FILE);

#open SESAME, ">filename.exe" or die $!;
#		binmode SESAME;

closedir(NT);

#----------
# Increment count and write to countfile:
#
open (COUNTFL, ">$countfile") || die "cannot open $countfile: $!\n";

$count++;			# increment count variable.

# Tracing:
print "The value of \$count is currently $count\n";
print "\n";

print COUNTFL "$count\n";	# DON'T forget to use handle in print
				# statement, to print to a file
close (COUNTFL);

# Tracing:
open (COUNTFL, "$countfile") || die "cannot open $countfile: $!\n";

$count = <COUNTFL>;

print "The value of \$count = $count\n";
print "\n";

close (COUNTFL);

#----------
$hold = <STDIN>;