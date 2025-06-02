#!/usr/bin/perl
# eh_bibleInspiration_controller.pl by Eric Hepperle - 06/23/13
#

=pod

=head1 NAME

eh_bibleInspiration_controller.pl - Controller script for interacting with the EHW_BibleInspiration module.

=head1 SYNOPSIS

This script serves as a controller for the EHW_BibleInspiration module, providing functionality to retrieve and display Bible-related data. It demonstrates how to instantiate the EHW_BibleInspiration object, retrieve a Bible object, and display its contents using Perl's Data::Dumper.

=head1 DESCRIPTION

The script performs the following tasks:

=over 4

=item 1. Instantiates an object of the EHW_BibleInspiration module.

=item 2. Retrieves a Bible object reference using the C<getBibleObj()> method.

=item 3. Retrieves a verse object using the C<getVerseObj()> method and prints its structure.

=item 4. Provides utility functions for displaying messages, handling errors, and listing hash contents.

=back

=head1 DEPENDENCIES

This script depends on the following modules:

=over 4

=item * C<strict> and C<warnings>: For enforcing good coding practices.

=item * C<Data::Dumper>: For debugging and printing data structures.

=item * C<EHW_BibleInspiration>: A custom module that provides Bible-related functionality.

=back

=head1 INPUT

The script accepts command-line arguments via C<@ARGV>, though none are explicitly used in the current implementation.

=head1 OUTPUT

The script produces the following output:

=over 4

=item * The type of the instantiated object and the Bible object reference.

=item * The structure of the verse object retrieved from the EHW_BibleInspiration module.

=item * Any messages or errors encountered during execution.

=back

=head1 GOTCHAS

=over 4

=item * Ensure that the C<EHW_BibleInspiration> module is available and properly configured in the Perl library path.

=item * The script currently exits prematurely after printing the verse object (C<exit> statement). Any subsequent code (e.g., C<listHash()> call) will not execute unless the C<exit> is removed or commented out.

=item * The C<getVerseObj()> method is called twice, but the second call is redundant due to the premature exit.

=item * The script assumes that the Bible object returned by C<getBibleObj()> is a hash reference. If this assumption is incorrect, the C<listHash()> function may fail.

=back

=head1 AUTHOR

Eric Hepperle

=head1 DATE

June 23, 2013

=cut

use strict;
use warnings;

use lib '.';  # Add the current directory to @INC
use Data::Dumper;
use EHW_BibleInspiration;

main(@ARGV);

sub main
{
    my $o = EHW_BibleInspiration->new; # instantiate new object.
    my $bo_ref = $o->getBibleObj();
    print "\$o is type: " . ref($o) . ".\n";
    print "\$bo_ref is type: " . ref($bo_ref) . ".\n";
    
    # print "GETTING VERSE OBJECT\n\n";
    # print Dumper($o->getVerseObj());
    
    # exit;
    
    $o->getVerseObj();
    # listHash($bo_ref);

    displayFormattedBibleVerses($bo_ref); # if ref($bo_ref) eq 'ARRAY';
    
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


sub displayFormattedBibleVerses {
    my ($bible_verses) = @_;
    
    # Debugging: Check the structure of $bible_verses
    print "Debug: \$bible_verses is of type: " . ref($bible_verses) . "\n";
    print Dumper($bible_verses);

    # Ensure $bible_verses is an array reference
    if (ref($bible_verses) eq 'ARRAY') {
        foreach my $verse (@{$bible_verses}) {
            print "Book: $verse->{book}, Chapter: $verse->{chapter}, Verse: $verse->{verse}, Text: $verse->{text}\n";
        }
    } else {
        error("Expected an array reference for Bible verses, but got: " . ref($bible_verses));
    }
}