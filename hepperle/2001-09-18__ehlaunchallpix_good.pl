#!/usr/bin/perl -w
#
# Program:	ehlaunchallpix_good.pl
# Creator:	Eric Hepperle
# Date:	09/18/2001

$title = ();
$hold = ();
$url = ();
$file = ();

################################################
# DEFINE TEST VARIABLES:
################################################
#
$rtpath = "http://www.news.com";

$picrt = "pageq_";

$count = 06;	#(or whatever the count is at the time,)

$picsuf = ();

$ext = "html";

################################################
# GET INPUT FROM USER:
################################################
#

print "Enter the start number: ";
$start = <STDIN>;
chomp $start;

print "Enter the ending number: ";
$end = <STDIN>;
chomp $end;

print "Enter the root path of the url: \n";
$rtpath = <STDIN>;
chomp $rtpath;

print "Enter the static doc name root part: ";
$picrt = <STDIN>;
chomp $picrt;

print "Enter the doc name suffix:";
$picsuf = <STDIN>;
chomp $picsuf;

print "Enter the extension: ";
$ext = <STDIN>;
chomp $ext;


#------------------
# Testing...
$picindex_log = "c:/windows/desktop/picindex_log.html";

open (INDEX, ">>$picindex_log");

   print INDEX "<HTML><BODY>\n\n";
   print INDEX "<TABLE>\n";
   
   &openmultiwindows;

   print INDEX "</TABLE></BODY></HTML>\n\n";


close (INDEX);

#$hold = <STDIN>;

sub createurl {

################################################
# VARIOUS ATTEMPTS TO CREATE THE URL:
################################################

$url = "$rtpath/$picrt$count$picsuf.$ext";

$url_t2 = "$rtpath/" . "$picrt" . "$count" . "$picsuf" . ".$ext";

$docname = "$picrt$count$picsuf.$ext";

################################################
# PRINT URL TEST OUTPUT:
################################################
#
# NOTE:		These worked on my AIX box at
#		work, but do not work on my
#		PC for some reason.
#
print "\n\n";
print $url;
print "\n\n";
print "another version ...\n";
print $url_t2;
print "\n";

}



sub openmultiwindows {

   for $count ($start..$end) {

   &createurl;
   
   &openurl;

   print "opened: $url\n\n";

   print INDEX "\n\n";
   print INDEX "<TR><TD>\n";
   print INDEX "<A HREF = \"$url\">$url\n";
   print INDEX "</A></TD></TR>\n";

   } 
}


sub openurl {

$page = $url;
$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
system ("explorer $page");

#system ("netscape $page");

#$hold = <STDIN>;

}
