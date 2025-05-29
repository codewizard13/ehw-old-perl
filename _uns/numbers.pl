#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $decimal = 12345;
    my $octal = 012345;
    my $hex = 0x1ab7;
    my $binary = 0b10101010;
    my $float = 1234.567;
    my $exp = 12.34e56;
    
    message("decimal is $decimal");
    message("octal is $octal");
    message("hex is $hex");
    message("binary is $binary");
    message("float is $float");
    message("exp is $exp");
    
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

