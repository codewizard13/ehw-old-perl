#!/usr/bin/perl

use LWP::UserAgent;
use HTML::LinkExtor;
use URI::URL;

# DOESN'T WORK.

# EH -- MY CODE HERE:
#
print "\n\n";

print "Enter a url to search: ";
$url2srch = <STDIN>;
chomp $url2srch;

# overide input and define default url:
$url2srch = "http://www.guguhp.hpg.ig.com.br/images/";

#  $url2srch = "http://www.perl.org/";  # for instance
  $ua = LWP::UserAgent->new;


  # Set up a callback that collect image links
  my @imgs = ();
  sub callback {
     my($tag, %attr) = @_;
     return if $tag ne 'img';  # we only look closer at <img ...>
     push(@imgs, values %attr);
  }


  # Make the parser.  Unfortunately, we don't know the base yet
  # (it might be diffent from $url2srch)
  $p = HTML::LinkExtor->new(\&callback);


  # Request document and parse it as it arrives
  $res = $ua->request(HTTP::Request->new(GET => $url2srch),
                      sub {$p->parse($_[0])});


  # Expand all image URLs to absolute ones
  my $base = $res->base;
  @imgs = map { $_ = url2srch($_, $base)->abs; } @imgs;


  # Print them out
  print join("\n", @imgs), "\n";

$hold = <STDIN>;
