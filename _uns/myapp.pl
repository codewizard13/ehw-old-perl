#!/usr/bin/env/ perl
use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;
    $self->render(text => 'Hello world!');
};

app->start;