#!/usr/bin/perl
#
#
# Program:	linkextortest_1.pl
# Creator:	Eric Hepperle
# Date:	12/17/01
#
# Purpose:	Simple demonstration of LinkExtor module.
#
###################################################
#
# Revisions:
#
#	12/17/01 - ORIGINAL
#
#		 - Works.
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#



print "\n\n";
print "This program is called linkextortest_1.pl\n\n";


require HTML::LinkExtor;
use URI::URL;
use LWP::Simple;

print "Enter url: \n";
$eurl = <STDIN>;
chomp $eurl;

@code = get($eurl);

# define html storage file:
$newhtmldoc = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/linkextortest.html";

open (TEST, ">$newhtmldoc");

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

       $p->parse_file("$newhtmldoc");  


       print TEST "</font>\n"; 

close (TEST);


system("netscape $newhtmldoc");
