#!/usr/bin/perl
#
# Program:	getjusturls.pl
# Creator:	Eric Hepperle
# Date:		09/21/01
#
# Purpose:	Not my script. Not sure what it does.  Relies heavily of the Parse submod of the HTML module.
#
####################################################


use LWP::Simple;
use HTML::Parse;
use HTML::Element;
use URI::URL;

print "Content-type:text/html\n\n";

$html        = get $ENV{'QUERY_STRING'};
$parsed_html = HTML::Parse::parse_html($html);

for (@{ $parsed_html->extract_links(a) }) {
  $link     = $_->[0];
  $url      = new URI::URL $link;
  $full_url = $url->abs($ENV{'QUERY_STRING'});
  print "$full_url<BR>";
}

$parsed_html->delete();
