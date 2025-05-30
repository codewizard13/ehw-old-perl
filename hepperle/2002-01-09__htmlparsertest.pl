#!/usr/bin/perl
#
#
# Program:	htmlparsertest.pl
# Creator:	Eric Hepperle
# Date:		12/17/01
#
# Purpose:	Demonstrates use of the HTML_Parser Module.  Doesn't work yet.
#
###################################################
#
# Revisions:
#
#	- Original:  12/17/01
#
#
#
###################################################
#
# Planned Improvements:
#
###################################################
#


print "\n\n";
print "This program is called htmlparsertest.pl\n\n";




use HTML::Parser ();

        sub start_handler
        {
          return if shift ne "title";
          my $self = shift;
          $self->handler(text => sub { print shift }, "dtext");
          $self->handler(end  => sub { shift->eof if shift eq "title"; },
                                 "tagname,self");
        }

        my $p = HTML::Parser->new(api_version => 3);
        $p->handler( start => \&start_handler, "tagname,self");
        $p->parse_file(shift || die) || die $!;
        print "\n";  




        HTML::Parser->new(default_h => [sub { print shift }, 'text'],
                          comment_h => [""],
                         )->parse_file(shift || die) || die $!;


