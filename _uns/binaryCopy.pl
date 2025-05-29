#!/usr/bin/perl
# files.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
#
# Eric's edit: 2011.05.31
# PROGRAM: binaryCopy.pl

use strict;
use warnings;
use IO::File;

main(@ARGV);

sub main
{
    my $origfile = "olives.jpg";
    my $newfile = "copy.jpg";
    my $bufsize = 1024 * 1024;
    
    my $origfh = IO::File->new($origfile, 'r') or
        error ("cannot open $origfile ($!)");
    my $newfh = IO::File->new($newfile, 'w') or
        error ("cannot open $newfile ($!)");
        
    $origfh->binmode(":raw");
    $newfh->binmode(":raw");
        
    my $buf = '';
    while ($origfh->read($buf, $bufsize)) {
    	$newfh->print($buf);
    }
    message("Done.");
    
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

