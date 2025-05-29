#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = '42';
    if (defined isnum($x)) {
    	message("x is a number ($x)");
    } else {
    	message("x is most definitely not a number");
    }
}

sub isnum
{
	my $n = shift; # pulls in argument
	return $n unless defined $n;
	if ($n =~ /[^0-9]/) {
		return undef;
	} else {
		return $n;
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

