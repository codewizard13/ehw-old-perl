#!/usr/bin/perl
#
#
# Program:	linkextortest_1_w2ndrefpg.pl
# Creator:	Eric Hepperle
# Date:	12/17/01
#
# Purpose:	Simple demonstration of HTML_LinkExtor module.  Gets all links found in the html doc and saves it to a file.  Checks for changes periodically (user specified), and if the page has changed it will record new info in a change_log.
#
#		There are 3 associated files:
#
#		 1)  $basehtmldoc:  where the code from
#		     indicated web page is stored. serves
#		     as a reference and all else is based off of this.
#
#		 2)  $urllog: ($filename_$date_urllog.txt);  a file
#		     that stores the urls found as text.
#
#		 3)  $urlpage: the HTML version where each url is
#		     made into a hyperlink.
#
#		 4)  $
#
###################################################
#
# Revisions:
#
#	12/17/01 - ORIGINAL
#
#		 - Works.
#
#	12/20/01 - Added code to check for differences.
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#



print "\n\n";
print "This program is called linkextortest_1_w2ndrefpg.pl\n\n";


require HTML::LinkExtor;
use URI::URL;
use LWP::Simple;


print "Enter url: \n";
$eurl = <STDIN>;
chomp $eurl;

@code = get($eurl);

# define html storage file:
$basehtmldoc = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/.html";

open (TEST, ">$basehtmldoc");

   # Test code:
   print TEST "<HTML>\n\n";
   print TEST "<HEAD>\n";
   print TEST "<TITLE>THIS IS THE TEST !!! THIS IS THE TEST !!!</TITLE>\n";
   print TEST "<META HTTP-EQUIV= \"refresh\" CONTENT= \"600; URL = $eurl\">\n";
   print TEST "</HEAD>\n";
   print TEST "<H2><FONT FACE = GILL SANS COLOR = LIME>\n\n";
   print TEST "E.H. RIPPED HTML CODE:<BR>\n";
   print TEST "======================</FONT></H2><BR><BR>\n\n";
   print TEST @code;
   print @code;
   print TEST "<BR>### END CODE ###<BR>\n";
   print TEST "---------------------------------------------------------<BR>\n\n";
   print TEST "These are the links that were found<BR><BR>\n\n";
   print TEST "<font color = lime>\n";

       # first part runs a subroutine, the second defines the base url.
       $p = HTML::LinkExtor->new(\&cb, "$eurl");

       sub cb {

           my($tag, %links) = @_;
           print "$tag @{[%links]}\n";
           print TEST "$tag @{[%links]}\n";

       }

       $p->parse_file("$basehtmldoc");  


       print TEST "</font>\n"; 

close (TEST);


system("netscape $basehtmldoc");
