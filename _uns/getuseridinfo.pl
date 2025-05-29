#!/usr/bin/perl
#
#
# Program:	getuseridinfo.pl
# Creator:	Eric Hepperle
# Date:	01/17/02
#
# Purpose:	Gets the userid of whoever is using the program. Also gets their homedir, full name and serial number.  Is base on the Perl env var $>.
#
###################################################
#
# Revisions:
#
#	- Original:  01/17/02
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
print "This program is called getuseridinfo.pl\n\n";


&getuserinfo;


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

   # Tracing:
   print "RESULT OF PASSWD FILE GREP:\n";
   print "$greppasswd\n";

}
