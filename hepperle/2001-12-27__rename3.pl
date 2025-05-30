#!/usr/bin/perl
#
#
# Program:	rename3.pl
# Creator:	Eric Hepperle
# Date:	12/28/01
#
# Purpose:	Rename files using split.
#
###################################################
#
# Revisions:
#
#	- Original:  12/28/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called rename3.pl\n\n";


use Cwd;

print "Enter the directory where the files are located: \n\n";
$filedir = <STDIN>;
chomp $filedir;
print "\n";

print "Enter the extension you want to change: ";
$ext_org = <STDIN>;
chomp $ext_org;
print "\n";

print "What do you want to change it to? ";
$ext_new = <STDIN>;
chomp $ext_new;
print "\n";


opendir (DIR, "$filedir");

   @filelist = readdir(DIR);
   
   chdir $filedir;

   print "The current directory is:\n\n";

   $curdir = cwd;

   print "$curdir\n\n";


   foreach $line (@filelist) {

      chomp $line;

      print "$line\n";

      $FileName = $line;

      &dorename;

   }

print "\n\n";

closedir (DIR);



sub dorename {
# This routine is from the following web page:
#
# http://www.dummies.com/Technology/Programming/Perl/0-7645-0776-1_0005.html

@spline = split (/\./, $FileName);

#$ext_act = $spline[1];


print "Filename: $spline[0]\tExt: $ext_act\n";


$PeriodPos = index($FileName, '.');
if($PeriodPos == -1) {
   $BareName = $FileName;
} else {
   $BareName = substr($FileName, 0, $PeriodPos);
}

print "Period Position: $PeriodPos\n";
$test1 =~ substr($FileName, 0, 3);
print "Test #1: $test1\n\n";

#------------------------------------------------------#
#
# NOTE:  I need to look at the INDEX (and related) function(s).
#
#------------------------------------------------------#

$NewName = "$BareName.$ext_new";

#rename($FileName, $NewName);

}
