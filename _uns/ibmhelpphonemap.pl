#!/usr/bin/perl
#
#
# Program:	ibmhelpphonemap.pl
# Creator:	Eric Hepperle
# Date:	12/07/01
#
# Purpose:	 Lets you type in what you are looking for and does a database search based on several search te rms, (not boolean).  Is not perfect but should be helpful.          For example:  If you want to know the 1-888-IBM-HELP path for Tivoli support, you would type in  "Tivoli" and it would bring up the response:          Tivoli:         4,3,8          Bada-bing, bada-boom!  No listening through multiple phone messages, just an instant path.          Will be a perl script at first, then try cgi, then try to incorporate a perl-web form interface.
#
###################################################
#
# Revisions:
#
#	- Original:  12/07/01
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
print "This program is called ibmhelpphonemap.pl";
print "\n\n";



print "What are you looking for? ";
$query = <STDIN>;
chomp $query;



if ($query =~ /[Nn][Oo][Tt][Ee]|[Ll][Oo][Tt][Uu][Ss]/) {

    $key = "NOTES";

} else {

    $key = $query;

}


%phnmap;


$phnmap{NOTES} = "1,1";
$phnmap{PRINT} = "1,2";
$phnmap{AIX} = "1,2,4";
$phnmap{AIXROC} = "4,3,6";
$phnmap{PC} = "1,2";
$phnmap{''} = "I DON'T KNOW!";



if ($phnmap{$query}) {

   print "\n\n\n"; 
   print "$query =	$phnmap{$key}\n\n";

}
