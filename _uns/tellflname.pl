#!/usr/bin/perl -w
#
# This simple script tell user the name of the file in
# the first statement, and the full path in the 2nd.
#(like UNIX "$0").

use File::Basename;
    my $progname = basename($0);

print "The name of this file is $progname \n";
print "\n";

print "\n";
print "The full path to this file is: $0 \n";
print "\n";


#----------
$hold = <STDIN>;