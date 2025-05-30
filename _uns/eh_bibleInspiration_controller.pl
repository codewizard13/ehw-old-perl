#!/usr/bin/perl
# eh_bibleInspiration_controller.pl by Eric Hepperle - 06/23/13
#

use strict;
use warnings;

use Data::Dumper;
use EHW_BibleInspiration;

main(@ARGV);

sub main
{
    my $o = EHW_BibleInspiration->new; # instantiate new object.
    my $bo_ref = $o->getBibleObj();
    print "\$o is type: " . ref($o) . ".\n";
    print "\$bo_ref is type: " . ref($bo_ref) . ".\n";
    
    print "GETTING VERSE OBJECT\n\n";
    print Dumper($o->getVerseObj());
    
    exit;
    
    $o->getVerseObj();
    listHash($bo_ref);
    
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

sub listHash
{
    my ($hash) = @_;
    foreach my $key (sort keys %{$hash}) {
        my $value = $hash->{$key};
        message("$key  => $value\n");
    }
}