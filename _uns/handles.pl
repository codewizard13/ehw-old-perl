#!/usr/bin/perl
# handles.pl by Eric Hepperle - 06/22/13
#

use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, '<', 'workingfile.txt') or error("cannot open file ($!)");
    print while <FH>;
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}

