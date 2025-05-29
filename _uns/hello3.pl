#!/usr/local/bin/perl
use Mojolicious::Lite;

get '/' => sub {
    shift->render('hello');
};

get '/:fname/:lname' => sub {
    shift->render('capture');
};

get '/foo' => sub {
  my $self = shift;
  my $user = $self->param('user');
  $self->render(text => "Hello $user.");
};

app->start;

__DATA__

@@ hello.html.ep
Hello World!

@@ capture.html.ep
Hello <%= param['fname'] %> <%= param['lname'] %>!