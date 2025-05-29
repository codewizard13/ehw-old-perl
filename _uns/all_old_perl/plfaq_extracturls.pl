#!/usr/bin/perl
#
# Program:	plfaq_extracturls.pl
# Creator:	Eric Hepperle
# Date:		09/19/01
#
# Purpose:	Not my script.  This is taken directly from Perl FAQ 9.  How to extract urls from an html source page.  It works!
#
#################################################
# 
# qxurl - tchrist@perl.com
#    print "$2\n" while m{
#        < \s*
#          A \s+ HREF \s* = \s* (["']) (.*?) \1
#        \s* >
#    }gsix;

# http://www.perl.com/CPAN/authors/Tom_Christiansen/scripts


# The example below was taken from:
#
#http://groups.google.com/groups?q=HTML::LinkExtor&hl=en&lr=lang_en&rnum=4&selm=3857B27A.4F2D5D5%40ip.media.kyoto-u.ac.jp
#

# use strict;
# use HTML::LinkExtor;
# use LWP::Simple;

#my %seen;
#my $url =
#"http://www.lab7.kuis.kyoto-u.ac.jp/~nisimura/le4/www.digitalcity.gr.jp/";
#my $parser = HTML::LinkExtor->new(undef, $url);
#$parser->parse(get($url))->eof;
#my @links = $parser->links;
#foreach my $linkarray (@links) {
#    my @element = @$linkarray;
#    my $elt_type = shift @element;
#    while (@element) {
#        my ($attr_name, $attr_value) = splice(@element, 0, 2);
#        $seen{$attr_value}++;
#    }
#}
#for (sort keys %seen) { print $_, "\n" }



use strict;
use HTML::LinkExtor;
use LWP::Simple;

my $start_time = `locatime`;


my $url = "http://www.lab7.kuis.kyoto-u.ac.jp/~nisimura/le4/www.digitalcity.gr.jp/";

my %seen;


print "\n\n";

#print "Enter a url to get links from:\n\n";
#my $url = <STDIN>;
#chomp $url;

my $parser = HTML::LinkExtor->new(undef, $url);

$parser->parse(get($url))->eof;

my @links = $parser->links;

foreach my $linkarray (@links) {

    my @element = @$linkarray;

    my $elt_type = shift @element;

    while (@element) {

        my ($attr_name, $attr_value) = splice(@element, 0, 2);

        $seen{$attr_value}++;

    }
}

for (sort keys %seen) { print $_, "\n" }


# The above seems to work!!!

print "\n\n";

