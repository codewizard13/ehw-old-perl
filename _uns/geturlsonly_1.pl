#!/usr/bin/perl -w
#
# Program:	geturlsonly.pl
# Creator:	Eric Hepperle
# Date:		09/21/01
#
# Purpose:	Not my script.  Script found on:
#
# http://www.gellyfish.com/htexamples/geturls.pl
#
#		Supposed to get urls, but doesn't work because it doesn't like the Parser.pm module.
#
##########################################################

use strict;

package GetUrls;

use vars qw(@ISA);

@ISA = qw(HTML::Parser);

require HTML::Parser;

use strict;


my $parser = new GetUrls;


$parser->parse_file($ARGV[0]);

for (keys %{$parser->{URLS}})
{
  print "$_ $parser->{URLS}{$_}\n";
}

sub start
{

   my($self,$tag,$attr,$attrseq,$orig) = @_;

   if ( $tag eq 'a')
     {
        if ($self->{cur_url} = $attr->{href})
          {
            $self->{got_href}++;
          }
     }
}

sub end
{
  my ($self,$tag) = @_;

  $self->{got_href}-- if ($tag eq 'a' && $self->{got_href} )
}

sub text
{
  my ($self,$text ) = @_;

  if ($self->{got_href} )
    {

      $self->{URLS}{$self->{cur_url}} .= $text; 
    }
}
