#!/usr/bin/perl -w -d
#
# Date:  09/19/01

use LWP::UserAgent;
  use HTML::LinkExtor;
  use URI::URL;


# EH -- MY CODE HERE:
#
print "\n\n";

print "Enter a url to search: ";
$url2srch = <STDIN>;
chomp $url2srch;

$url2srch = "file://c:/documents and settings/nunya_beezniss/desktop/all_old_perl/test.html";


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