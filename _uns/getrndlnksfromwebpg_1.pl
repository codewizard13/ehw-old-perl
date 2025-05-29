#!/usr/bin/perl
#
#
# Program:	getrndlnksfromwebpg.pl
# Creator:	Eric Hepperle
# Date:	11/29/01
#
# Purpose:	Based on the ActivePerl Documentation example for HTML_LinkExtor.  Gets a random link from a given url. This script gives diagnostic output and tracing to show how it works (added by me).
#
###################################################
#
# Revisions:
#
#	- Original:  11/29/01
#
#	WORKS GREAT !!! -->  Do Not Modify !!
#
###################################################
#
# Planned Improvements:
#
###################################################
#

use HTML::LinkExtor;
use HTML::Parser;
use LWP::Simple;

print "\n\n";
print "This program is called getrndlnksfromwebpg.pl";
print "\n";

# Test url.
#$url = "http://www.google.com/";

print "\n\n";
print "Enter a fully qualified url:\n";
$url = <STDIN>;
chomp $url;

$parser = HTML::LinkExtor->new(undef, $url);
$parser->parse(get($url))->eof;
@links = $parser->links;

foreach $linkarray (@links) {

    @element = @$linkarray;

    # Tracing:
    print "\@element = @element\n\n";
    print "\$linkarray = $linkarray\n\n";

    $elt_type = shift @element;

    # Tracing:
    print "\$elt_type = $elt_type\n\n";

    while (@element) {

        ($attr_name, $attr_value) = splice(@element, 0, 2);

        # Tracing:
        print "\$attr_name, \$attr_value = $attr_name, $attr_value\n\n";

        # Quandry:  I don't understand what this is doing ???
        $seen{$attr_value}++;

    }

}

@links=keys %seen;

# Tracing:
print "\@links = @links\n\n";

$erer = $links[rand @links],"\n";

print "\$erer = $erer \n\n";
print "*** THE END ***\n";
