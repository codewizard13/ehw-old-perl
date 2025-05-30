#!/usr/bin/perl -w
#
# Program:	createpixfilelist_121101.pl
# Creator:	Eric Hepperle
# Date:	12/11/2001
#
###############################################
#
# Revisions:
#
#	12/13/01 - Updated to create a text list
#		     of urls as well as the html.
#
###############################################

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


# If user doesn't enter anything, then ...
if ($rtpath eq "") {

   $rtpath = "http://ss2.sexshare.com/~eco1/ecom";
   
}

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
$picindex_log = "c:/windows/desktop/pixurllist.html";

# define text only list file.
$picurls_txt = "c:/windows/desktop/picurls.txt";

open (INDEX, ">>$picindex_log");

open (TEXT, ">>$picurls_txt");

   print INDEX "<HTML><BODY>\n\n";
   print INDEX "<TABLE>\n";
   
   &openmultiwindows;

   print INDEX "</TABLE></BODY></HTML>\n\n";

close (TEXT);

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
   
   # commented out to prevent browser windows
   # from launching.
   # opening&openurl;

   print "opened: $url\n\n";

   print INDEX "\n\n";
   print INDEX "<TR><TD>\n";
   print INDEX "<A HREF = \"$url\">$url\n";
   print INDEX "</A></TD></TR>\n";

   # Print url to text only file.
   print TEXT "$url\n";

   } 
}


sub openurl {

$page = $url;
$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
system ("explorer $page");

$netscape_path = "file:///C:/WINDOWS/Desktop/EH New Files Post-051301/EH ALL APPLICATIONS CUMULATIVE INVENTORY/APPS - Internet/Netscape Backup Files/Netscape/Netscape 6/netscp6.exe";


#system ("netscp6 $page");

#$hold = <STDIN>;

}
