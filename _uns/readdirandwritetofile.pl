#!/usr/bin/perl

# Program:	readdirandwritetofile.pl
# Creator:	Eric Hepperle
# Date:	12/28/01



use LWP::Simple;


$home = "c:/windows/desktop";

$outfile = "$home/dirlisting.txt";

print "Enter the path to the directory to list:\n\n";
$path = <STDIN>;
chomp $path;

if ($path eq "") {
   # set default path:
   $path = "$home";

}


print "Here is the path that will be read: \n\n";
print "$path\n\n";

print "(PRESS ENTER TO CONTINUE)\n";
$hold = <STDIN>;


opendir(DIR, "$path");
   @filelist = readdir(DIR);
closedir(DIR);


open (OUT, ">$outfile");

   foreach $file (@filelist) {


      print OUT "$file\n";

   }


close (OUT);


$hold = <STDIN>;
