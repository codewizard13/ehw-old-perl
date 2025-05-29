#!/usr/bin/perl
# builtins.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec  );
#    push(@list, 'Foo'); # adds to end of list
#    my $string = pop(@list); # can also be written pop @list, but parens make clearer
#    my $string = shift(@list); # shift gets item from front of list
#    message($string);
#    message(join(':', @list));
#    unshift(@list, $string); # puts item on front of list
#    message(join(':', @list));

    message(join(':', reverse(@list))); # print copy of list in reverse
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

