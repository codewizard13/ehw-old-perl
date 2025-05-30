# EHW_BibleInspiration.pm
#   EHW_BibleInspiration.
#

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

sub getBibleObj
{
    my ($self) = @_;
    
    # create bible verse object (ESV)
    my $bibleObj_ref = {
        'john 3:16'         => 'For God so loved the world,that he gave his only Son, that whoever believes in him should not perish but have eternal life.',
        'matt 10:8'         => 'Heal the sick, raise the dead, cleanse lepers, cast out demons. You received without paying; give without pay.',        
        'Luke 6:38'         => 'Give, and it will be given to you. Good measure, pressed down, shaken together, running over, will be put into your lap. For with the measure you use it will be measured back to you.',              
        'John 16:24'        => 'Until now you have asked nothing in my name. Ask, and you will receive, that your joy may be full.',        
        'Psalms 32:7'       => 'You are a hiding place for me; you preserve me from trouble; you surround me with shouts of deliverance. Selah',
        'Proverbs 3:5-6'    => 'Trust in the LORD with all your heart, and do not lean on your own understanding. 6 In all your ways acknowledge him, and he will make straight your paths.',
        'John 14:1'         => 'Let not your hearts be troubled. Believe in God; believe also in me.',
        'Acts 1:8'          => 'But you will receive power when the Holy Spirit has come upon you, and you will be my witnesses in Jerusalem and in all Judea and Samaria, and to the end of the earth.',
        'John 14:26'        => 'But the Helper, the Holy Spirit, whom the Father will send in my name, he will teach you all things and bring to your remembrance all that I have said to you.',
        'I Corinthians 14:1-5' =>
                            'Pursue love, and earnestly desire the spiritual gifts, especially that you may prophesy. 2For one who speaks in a tongue speaks not to men but to God; for no one understands him, but he utters mysteries in the Spirit. 3On the other hand, the one who prophesies speaks to people for their upbuilding and encouragement and consolation. 4The one who speaks in a tongue builds up himself, but the one who prophesies builds up the church. 5Now I want you all to speak in tongues, but even more to prophesy. The one who prophesies is greater than the one who speaks in tongues, unless someone interprets, so that the church may be built up.'
    };
    
    my $out = "The BIBLE is awesome!\n";
    
    return $bibleObj_ref;
}

1;
