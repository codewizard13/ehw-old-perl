#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Mojo::DOM;

# slurp all DATA lines
my $dom = Mojo::DOM->new(do { local $/; <DATA> });

# select all children of <div id="yay"> into a Mojo::Collection
my $yay = $dom->at('#yay')->children;

# select interesting ('..' operator in scalar context: flip-flop)
my $interesting = $yay->grep(sub { my $e = shift;
    $e->type eq 'h1' .. $e->type eq 'h2';
});

say $interesting->join("\n");

__DATA__
<div id="yay">
    <span>This isn't interesting</span>
    <h1>INTERESTING STARTS HERE</h1>
    <strong>SOMETHING INTERESTING</strong>
    <span>INTERESTING TOO</span>
    <h2>END OF INTERESTING</h2>
    <span>This isn't interesting</span>
</div>