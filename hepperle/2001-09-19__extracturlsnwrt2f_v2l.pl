#!/usr/bin/perl -w
#
# Program:	extracturlsnwrt2fl.pl
# Creator:		Eric Hepperle
# Date:		09/19/01
#
# Purpose:	Lets user input a url, then extracts all links out
#		of the url and writes them to a log file (or html).
#
# Much of the code below was taken from the following post:
#
# http://groups.google.com/groups?q=my+%24parser+%3D+HTML::LinkExtor&hl
# =en&rnum=3&selm=3857B27A.4F2D5D5%40ip.media.kyoto-u.ac.jp
#

#use strict;
use HTML::LinkExtor;
use LWP::Simple;



print "Enter a url to get links from: \n\n";
my $url = <STDIN>;
chomp $url;

# Test url:
# http://www.lab7.kuis.kyoto-u.ac.jp/~nisimura/le4/www.digitalcity.gr.jp

# define link log file:
my $linklog = "c:/windows/desktop/eh_suckedlinks.html";

# open an html log file to store the links:
open (LOG, ">>$linklog");

   print LOG "\n <BR><BR><BR>";

   &sucklinks;

   for (sort keys %seen) { print $_, "\n" }

   for (sort keys %seen) {

      print LOG "<A HREF = \"$_\" TARGET = TOP>$_</A>  <BR>\n";

      
    }

   # print spacer lines in log file:

   print LOG "\n<BR><BR><BR>";

close (LOG);

############################################################
# SUBROUTINES:
############################################################
#

sub sucklinks {

   %seen;

   $parser = HTML::LinkExtor->new(undef, $url);

   $parser->parse(get($url))->eof;

   @links = $parser->links;

   foreach my $linkarray (@links) {

       my @element = @$linkarray;

       my $elt_type = shift @element;

       while (@element) {

             my ($attr_name, $attr_value) = splice(@element, 0, 2);

             $seen{$attr_value}++;
       }

   }

}
# -- END OF SUB -- #


#----------------------------------------------------------------------#

# 

print "<PRESS ANY KEY TO CONTINUE:>\n\n";
my $hold = <STDIN>;