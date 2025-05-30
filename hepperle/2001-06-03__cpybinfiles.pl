#!/usr/bin/perl -w
#
# Program:	cpybinfiles.pl
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
# Make new dir:
#

print "\n";

$newdir = "C:/windows/desktop/temp_dir";
print "\n";
chomp $newdir;			# don't forget to chomp!!!

print "\n";

# Actually make directory.

if (! -e $newdir) {

     print "The folder $newdir does not exist ...\n";
     print "\n";     

     mkdir ("$newdir", 0755) or die "Could not make directory newdir: $!";

     # Tell user the folder was created, ( Right now I
     # am not checking to see if this is true, but
     # I will have to implement that code later and it
     # will probably go here).
     #
     print "The directory $newdir was created successfully.\n";
     print "\n";

} else {

     print "The folder $newdir already exists ...\n";
     print "\n";

     print "Proceeding with the rest of the program ...\n";
     print "\n";

}


#****************************************#
#***** Make Duplicates of binaries: *****#
#****************************************#
#



opendir(NT,"$newdir") || die "Cannot opendir $newdir: $!";

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
$hold = <STDIN>;