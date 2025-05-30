#!/usr/bin/perl
#
#
# Program:	getalllinksfromwebpage.pl
# Creator:	Eric Hepperle
# Date:		11/29/01
#
# Purpose:	Based on the ActivePerl Documentation example for HTML_LinkExtor.  Gets a random link from a given url.
#
###################################################
#
# Revisions:
#
#	- Original:  11/29/01
#
#	
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
print "This program is called getalllinksfromwebpage.pl";
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

$linklog = "/afs/rchland.ibm.com/usr3/v2cib484/tmp/suckedlinks.txt";

open (LINKLOG, ">>$linklog");

foreach $linkarray (@links) {

    @element = @$linkarray;

    # Tracing:
    print "\@element = @element\n\n";
    # print "\$linkarray = $linkarray\n\n";

    $elt_type = shift @element;

    # Tracing:
    # print "\$elt_type = $elt_type\n\n";

    while (@element) {

        ($attr_name, $attr_value) = splice(@element, 0, 2);

        # Tracing:
        # print "\$attr_name, \$attr_value = $attr_name, $attr_value\n\n";

        # print this link to log file:
        print LINKLOG "$attr_value\n\n";

        # Quandry:  I don't understand what this is doing ???
        $seen{$attr_value}++;

    }

}


@links=keys %seen;

# Tracing:
#print "\@links = @links\n\n";

$rndlnk = $links[rand @links],"\n";

print "\$rndlnk = $rndlnk \n\n";
print "*** THE END ***\n\n\n";

$file = "file///:$linklog";

system ("netscape $linklog");
