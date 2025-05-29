#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = (1, "two", 3, 4);
    message($array[0]);
    message("there are " . scalar @array . " elements in the array")

    # my ($one, $two, $three, $four) = (1, 2, 3, 4);
    # message(join(":", @array));
    
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

