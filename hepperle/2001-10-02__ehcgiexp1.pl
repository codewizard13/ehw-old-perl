#!/usr/bin/perl
# File ehcgiexp1.pl created by Eric Hepperle at 13:28:36 on Wed Sep 19 2001. 
#
# This appears to be a test script for parsing long/complex urls.  Does not work yet.


#use CGI
use CGI qw/:standard/;

use URI::URL;

print "\n\n";

  my %q = url("./SELECT_cgi/owa/SOLS.VaultDetail?Application=Engineering+Links%3CSUP%3ETM%3C/SUP>&PlatformName=Intel(R)+and+compatible+PCs+running+Windows+95", "http:")->query_form;

  print "$q{PlatformName}\n";;
  print "$q{Application}\n";

print "Enter a new url: ";
$url = <STDIN>;
chomp $url;

# test url:
#
# http://groups.google.com/groups?as_q=cgi&as_epq=image%20table&as_oq=perl&lr=lang_en&num=100

my %u = url("$url", "http:") -> query_form;

   print "$u{as_q}\n";
   print "$u{as_epq}\n";
   print "$u{as_oq}\n";
   print "$u{lr}\n";
   print "$u{num}\n";
   print "\n";


# this should extract arguments from the url:


my $query = new CGI("$url");

my @names = $query -> param;

print "\@names = @names\n\n";

print "\$query = $query\n\n";

