#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = %ENV;
    while (my ($k, $v) = each %hash) {
        message("$k is $v");  # problem is output in random order
                              # ... CAN'T SORT!!!
    }
    message("=====");
    foreach my $k ( sort keys %hash) { # PREFERRED, sortable
    	my $v = $hash{$k};
    	message("$k is $v");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

