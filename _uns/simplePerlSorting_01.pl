#!/local/bin/perl
 
use strict;
use warnings;
 
use Data::Dumper;
 
print "Content-Type: text/html; charset=ISO-8859-1\n\n";
print "Hello Eric's World!\n";
 
my @not_sorted = qq(banana apple pear);
my @words = ('gorilla', 'orangutang', 'aardvark', 'mouse');
my @sorted = sort { $a <=> $b } @not_sorted; # numerical sort
 
 
print "NOW SORTING WORDS<br />";
 
# Get an alphabetical sort of words, but make 'aardvark' always come last.
@sorted = sort {
                if ($a eq 'aardvark') {
                                return 1;
                } elsif ($b eq 'aardvark') {
                                return -1;
                } else {
                                return $a cmp $b;
                }
} @words;
 
print "sorted = <br />";
print Dumper(@sorted);