#!/usr/bin/perl
#
#
# Program:	filecopytest.pl
# Creator:	Eric Hepperle
# Date:		01/22/02
#
# Purpose:	Tests the File_Copy module. WORKS! 
#
###################################################
#
# Revisions:
#
#	- Original:  01/22/02
#
#	 NOTE:	I had to make it add the homedir to
#		the source file so it created the
#		correct path.
#
###################################################
#
# Planned Improvements:
#
###################################################
#



print "\n\n";
print "This program is called filecopytest.pl\n\n";


use File::Copy;
use Cwd;

$dir = cwd;


&getuserinfo;
print "\n\n";


# define startdir.
$startdir = $dir;

# TRACING:
print "HOMEDIR:\t $homedir\n\n";

# Get source filename from user:
print "Enter the name of the source file:\n\n";
$source = <STDIN>;
chomp $source;

# define destination folder.
$destdir = "$homedir/tmp";

# define destination file.
$destfile = "$destdir/$source.copy";

# assume the source file will always be in the root dir.
$sourcefull = "$homedir/$source";

unless (-e $destdir) {
   mkdir ($destdir, 755)	
}

copy($sourcefull, $destfile);

system("netscape $destfile");


sub getuserinfo {

   # This returns a number which is the actual userid of the user.
   # This number doesn't mean anything to us, but we can use it
   # as a key to find the user's info in the passwd file.
   # The passwd file records this info in the 3rd field.
   #
   $useridnum = $>;

   # get user id and serial.
   $greppasswd = `grep $> /etc/passwd`;
   #
   # remove new line char from end of string.
   chomp $greppasswd;

   # PARSE greppasswd:
   #
   # split the result of the grep at colons.
   @spgrep = split(/:/, $greppasswd);

   $userid = @spgrep[0];
   $isvend = @spgrep[1];
   $fullname = (split(/,/, @spgrep[4]))[0];



   # Tracing:
   print "\$fullname = $fullname\n";

   # parse first and last name from fullname var.
   @spname = split(/ /, $fullname);   
   
   $firstname = $spname[0];
   $lastname = $spname[1];
   $serial = (split(/,/, @spgrep[4]))[1];
   $homedir = @spgrep[5];
   $dshell = @spgrep[6];


   # Tracing:
   $count = 0;
   print "TRACING:\n";
   print "=================================\n";
   foreach $el (@spgrep) {
      print "\@spgrep[$count] =\t @spgrep[$count]\n";
      $count++;
   }
   print "\n\n";
   

   # Tracing:
   print "FULL NAME:\t $fullname\n\n";
   print "SERIAL:\t $serial\n\n";
   print "FIRST NAME:\t $firstname\n";
   print "LAST NAME:\t $lastname\n";
   print "\n";

   # Tracing:
   print "RESULT OF PASSWD FILE GREP:\n";
   print "$greppasswd\n";

}
