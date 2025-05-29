#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $n = shift || 5;
    my $r = factorial($n);
    message("$n factorial is $r");
}

# factorial ( n )
# returns the product of all integers up to and including n
sub factorial
{
	my $n = shift or return 0; # return 0 if no n
	if ($n > 1){   # only compute for n > 1
		return $n * factorial( $n - 1 ); # recursion
	} else {
		return 1; # return 1 for n = 1
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

