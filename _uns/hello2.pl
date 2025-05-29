#!/usr/local/bin/perl
use Mojolicious::Lite;

get '/' => sub {

    my $self = shift;
    $self->render(text => 'Hello!');
    
};

app->start;

# hello2

