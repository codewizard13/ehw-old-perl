#!/usr/bin/perl

# File:        changeSubdirIcons_01.pl
# Author:      Eric Hepperle
# Created:     01/26/13
#
# Purpose:     In Windows, change folder icon of
#              each subdir in a given folder.
#
# Notes:       01/27/01
#
#                 12:41 AM    - Created File.
#                               It is not quite working.  The desktop.ini files
#                               get written fine, but the attrib isn't being
#                               set.  Need to investigate MSDOS::Attrib.
#
#                 9:05 PM     - Installed MSDOS::Attrib package in ppm.
#

use strict;
use warnings;

use Cwd;
use Data::Dumper;

print "\nHello Worldz!\n\n\n";

# record start dir
#my $root_dir = cwd();
my $root_dir = "C:\\Documents and Settings\\nunya\\My Documents\\Downloads\\TEST_DIR";
chdir $root_dir;

# get list of all subdirectories
my $dirs_str = `dir /ad /b`;

print "********************************\n\n";
print "\$root_dir = $root_dir\n\n";
print "\$dirs_str = $dirs_str\n\n";

# split dirs string into an array of dir names
my @subdirs = split('\n', $dirs_str);
my @sds_filt;
print Dumper(@subdirs), "\n\n";

# remove . and .. directories (current, parent) from list
foreach my $el (@subdirs) {

#   if ($el !~ |\.{1,2}|) {
    if ($el ne "." && $el ne "..") {
        push (@sds_filt, $el);
   }

}

print "Filtered Directory List:\n\n";
print Dumper(@sds_filt), "\n\n";


# add desktop.ini to each subfolder
foreach my $sd (@sds_filt) {

   my $fullPath = "$root_dir\\$sd";
   print "FullPath: $fullPath\n";
   print "pause ... "; <STDIN>;

   if (open (MYFILE, ">$fullPath\\desktop.ini")) {
       print "SUCCESSFULLY OPENED $root_dir\\$sd\\desktop.ini FOR WRITING :)!\n\n";
   } else {
       die "Failed to open $root_dir\\$sd\\desktop.ini!: $!\n";
   }
   print MYFILE qq{[.ShellClassInfo]\n};
   print MYFILE qq{IconFile=%SystemRoot%\\system32\\SHELL32.dll\n};
   print MYFILE qq{IconIndex=114\n};

   print "FILE SUCCESSFULLY WRITTEN TO FOLDER!\n\n";
   print "\n-------------------\n\n";
   close (MYFILE);

   # set attribute on this subdir
   `attrib -H -R +S $fullPath /S /D`
      or die "Could not set attributes on $fullPath!: $!\n\n";

   <STDIN>;

   # ... leaving off here.  It is not quite working.  The
   # desktop.ini files get written fine, but the attrib isn't
   # being set.  Need to investigate MSDOS::Attrib






}


