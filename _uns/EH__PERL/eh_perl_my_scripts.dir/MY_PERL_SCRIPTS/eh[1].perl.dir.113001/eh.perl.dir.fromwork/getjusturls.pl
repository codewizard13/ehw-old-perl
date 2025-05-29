#!/usr/bin/perl
# File getjusturls.pl created by Eric Hepperle at 07:21:28 on Fri Sep 21 2001. 

# Not my script.

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

$hold = <STDIN>;