#!/usr/bin/perl
# creating.pl by Eric Hepperle - 06/22/13
#

use strict;
use warnings;
use Example;

main(@ARGV);

sub main
{
    my $o = Example->new; # instantiate new object.  "Example" is what gets shifted into $class
    $o->copyfile("olives.jpg", "newfile.jpg"); # method call
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
    print("$0: $e\n");
    exit 0;
}

