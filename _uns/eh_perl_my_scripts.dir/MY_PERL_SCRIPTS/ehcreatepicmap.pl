#!/usr/bin/perl -w
#
#

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
$picindex_text = "c:/windows/desktop/picindex.txt";

open (IDXTXT, ">>$picindex_text");

open (INDEX, ">>$picindex_log");

   print INDEX "<HTML><BODY>\n\n";
   print INDEX "<TABLE>\n";
   
   &openmultiwindows;

   print INDEX "</TABLE></BODY></HTML>\n\n";


close (INDEX);

close (IDXTXT);

#$hold = <STDIN>;

sub createurl {

################################################
# VARIOUS ATTEMPTS TO CREATE THE URL:
################################################

$url_t1 = "$rtpath/$picrt$count$picsuf.$ext";

$url_t2 = "$rtpath/" . "$picrt" . "$count" . "$picsuf" . ".$ext";

################################################
# PRINT URL TEST OUTPUT:
################################################
#
# NOTE:		These worked on my AIX box at
#		work, but do not work on my
#		PC for some reason.
#
print "\n\n";
print $url_t1;
print "\n\n";
print "another version ...\n";
print $url_t2;
print "\n";

}



sub openmultiwindows {

   for $count ($start..$end) {

   &createurl;
   
   &openurl;

   print "opened: $url_t1\n\n";

   print INDEX "\n\n";
   print INDEX "<TR><TD>\n";
   print INDEX "<A HREF = \"$url_t1\">$url_t1\n";

      print IDXTXT "$url_t1\n";

   print INDEX "</A></TD></TR>\n";

   } 
}


sub openurl {

$page = $url_t1;
$file = 'file:///afs/rchland.ibm.com/usr3/v2cib484/tmp/somefile';
system ("explorer $page");

#system ("netscape $page");

#$hold = <STDIN>;

}





#-----------------------------------------#

$count = 1;
$title = "Picture Map File";

$picmapfile = "c:/windows/desktop/picmapfile.html";

# set rows = 5 and height eq 

open (MAPFILE, ">$picmapfile");

   print MAPFILE "<HTML>\n";
   print MAPFILE "<HEAD>\n";
   print MAPFILE "<TITLE>\n";
   print MAPFILE "\$title\n";
   print MAPFILE "</TITLE>\n";
   print MAPFILE "</HEAD>\n\n";
   print MAPFILE "<BODY>\n\n";

   &bodysub;

   print MAPFILE "</BODY></HTML>\n\n";

close (MAPFILE);

$hold = <STDIN>;


#########################################
# SUBROUTINES:
#########################################
#


sub bodysub {

   &mktablesub;

}

sub mktablesub {

   print MAPFILE "<CENTER>\n";
   print MAPFILE "<TABLE border=1>\n\n";
      
   &mkrow;

   print MAPFILE "</TABLE></CENTER>\n\n";

}

sub mkrow {



      # Create each row:
      #
      print MAPFILE "   <!--### ROW $count ###-->\n";
   	print MAPFILE "   <TR>\n";
	print MAPFILE "      <TD><IMG src=\"$url\" \n";
      print MAPFILE "         height=100 width=100>\n";
	print MAPFILE "      <BR><U>$docname</U></TD>\n";
      print MAPFILE "   <TR>\n\n";


}