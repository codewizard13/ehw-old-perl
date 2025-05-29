#!/usr/bin/perl
# files.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
# Eric's edit: 2011.05.31
# PROGRAM: copyFiles.pl

use strict;
use warnings;
use IO::File;

main(@ARGV);

sub main
{
    my $fh = IO::File->new('workingfile.txt', 'r') or
        error("cannot open file for read ($!)");
    my $nfh = IO::File->new('newfile.txt', 'w') or
        error("cannot open file for write ($!)");
        
    while(my $line = $fh->getline ) {
    	$nfh->print($line);
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
    print(STDERR "$0: $e\n");
    exit 0;
}

