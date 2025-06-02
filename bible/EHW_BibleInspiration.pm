# EHW_BibleInspiration.pm
#   EHW_BibleInspiration.
#

=pod

=head1 NAME

EHW_BibleInspiration - A module for managing and retrieving Bible verses.

=head1 SYNOPSIS

This module provides functionality to create a Bible object containing verses and retrieve individual verses or the entire collection. It is designed to be used in conjunction with other scripts, such as a controller script.

=head1 DESCRIPTION

The EHW_BibleInspiration module performs the following tasks:

=over 4

=item 1. Creates a new object instance of the module.

=item 2. Provides a method (C<getBibleObj>) to create and return a hash reference containing Bible verses.

=item 3. Provides a method (C<getVerseObj>) to retrieve and display Bible verses, with the potential to implement random verse selection.

=back

=head1 DEPENDENCIES

This module depends on the following Perl modules:

=over 4

=item * C<strict> and C<warnings>: For enforcing good coding practices.

=item * C<IO::File>: For file handling (though not currently used in the implementation).

=item * C<Data::Dumper>: For debugging and printing data structures.

=back

=head1 METHODS

=over 4

=item * C<new>: Constructor method to create a new instance of the module.

=item * C<getBibleObj>: Returns a hash reference containing a collection of Bible verses.

=item * C<getVerseObj>: Retrieves and displays Bible verses. Currently, the implementation is incomplete and commented out.

=back

=head1 OUTPUT

The module produces the following output when its methods are called:

=over 4

=item * A hash reference containing Bible verses (via C<getBibleObj>).

=item * Debugging information or printed Bible verses (via C<getVerseObj>, if implemented).

=back

=head1 GOTCHAS

=over 4

=item * The C<getVerseObj> method is incomplete and contains commented-out code. It does not currently return a random verse or any meaningful output.

=item * The module includes unused code and commented-out sections, which may cause confusion during maintenance.

=item * The C<IO::File> module is included but not used in the current implementation.

=back

=head1 AUTHOR

Eric Hepperle

=head1 DATE

July 3, 2013

=cut

package EHW_BibleInspiration;
use strict;
use warnings;
use IO::File;
use Data::Dumper;

our $VERSION = "0.1";

sub new
{
    my $class = shift;
    my $self = {};
    bless($self, $class); # turns hash into object
    return $self;
}

sub getVerseObj
{
    my ($self) = @_;
    
    print "My Bible Verse:\n\n";
    my $verses = $self->getBibleObj();
#    return $verses;

    # get random verse
    #$knockknocks{(keys %knockknocks)[rand keys %knockknocks]};

#}
#  sub mysub {
#    my $params = shift;
#    my %paramhash = %$params;
#  }
#
#    my %verses = %{$verses};
#my $random_value = $verses{(keys %{$verses})[rand keys %{$verses}]};

#    print Dumper(%{$random_value});
#    print "\$random_value:\n\n";
#    print Dumper($random_value);
}

sub getBibleObj {
    my ($self) = @_;
    
    # Create a hierarchical Bible object (ESV)
    my $bibleObj_ref = {
        'John' => {
            3 => {
                16 => 'For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life.',
                17 => 'For God did not send his Son into the world to condemn the world, but in order that the world might be saved through him.',
            },
            14 => {
                1 => 'Let not your hearts be troubled. Believe in God; believe also in me.',
                26 => 'But the Helper, the Holy Spirit, whom the Father will send in my name, he will teach you all things and bring to your remembrance all that I have said to you.',
            },
            16 => {
                24 => 'Until now you have asked nothing in my name. Ask, and you will receive, that your joy may be full.',
            },
        },
        'Matthew' => {
            10 => {
                8 => 'Heal the sick, raise the dead, cleanse lepers, cast out demons. You received without paying; give without pay.',
            },
        },
        'Luke' => {
            6 => {
                38 => 'Give, and it will be given to you. Good measure, pressed down, shaken together, running over, will be put into your lap. For with the measure you use it will be measured back to you.',
            },
        },
        'Psalms' => {
            32 => {
                7 => 'You are a hiding place for me; you preserve me from trouble; you surround me with shouts of deliverance. Selah',
            },
        },
        'Proverbs' => {
            3 => {
                '5-6' => 'Trust in the LORD with all your heart, and do not lean on your own understanding. In all your ways acknowledge him, and he will make straight your paths.',
            },
        },
        'Acts' => {
            1 => {
                8 => 'But you will receive power when the Holy Spirit has come upon you, and you will be my witnesses in Jerusalem and in all Judea and Samaria, and to the end of the earth.',
            },
        },
        'I Corinthians' => {
            14 => {
                '1-5' => 'Pursue love, and earnestly desire the spiritual gifts, especially that you may prophesy. For one who speaks in a tongue speaks not to men but to God; for no one understands him, but he utters mysteries in the Spirit. On the other hand, the one who prophesies speaks to people for their upbuilding and encouragement and consolation. The one who speaks in a tongue builds up himself, but the one who prophesies builds up the church. Now I want you all to speak in tongues, but even more to prophesy. The one who prophesies is greater than the one who speaks in tongues, unless someone interprets, so that the church may be built up.',
            },
        },
    };
    
    return $bibleObj_ref;
}

1;
