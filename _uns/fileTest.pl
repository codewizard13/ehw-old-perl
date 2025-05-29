#!/usr/bin/perl
# operators.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
# PROGRAM: fileTest.pl
# PURPOSE: Demonstrates file test operators
# CREATOR: Eric Hepperle
# DATE:    2011.06.01
#

use strict;
use warnings;

main(@ARGV);

sub main
{
    my @dirlist = <*>;
    foreach my $fn (@dirlist) {
    	if (-f  $fn){
    		my $size = -s $fn;
    		message("$fn is a plain file ($size bytes)");
    	} elsif (-d $fn) {
    		message("$fn is a directory");
    	} else {
    		message("$fn is something else");
    	}
    	
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

