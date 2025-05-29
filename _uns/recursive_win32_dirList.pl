#!/usr/bin/perl

# Basic Recursive Directory listing program.
# Does not print out any html or text docs;
# the list is only in the console window.
#


$maindir = "c:/documents and settings/nunya_beezniss/desktop";
$htmlfile = "$maindir/dirlist.html";
$textfile = "$maindir/dirlist.txt";

print "Enter the directory to list out:  \n";
$selectedDir = <STDIN>;
chomp $selectedDir;
print "\n\n";

#my($root) = "C:\\users";
my($selectedDir) = "c:/documents and settings/nunya_beezniss/desktop";
DoDir($selectedDir);

sub DoDir {
  my($dir) = shift;
  my($file);
  opendir(DIR, $dir) || die "Unable to open $dir :$!";
  my(@files) = grep {!/^\.\.?$/ } readdir(DIR);
  closedir(DIR);
  foreach (@files) {
     if (-d ($file = "$dir\\$_")) {
          print "Found a directory: $file\n";
          DoDir($file);
     } else {
          print "File $file\n";
     }
  }
}