#!/usr/bin/env perl
use Mojolicious::Lite;

use lib 'lib';
use MyUsers;

# Helper to lazy initialize and store our model object
helper users => sub { state $users = MyUsers->new };

# /?user=sri&pass=secr3t
any '/' => sub {
  my $self = shift;

  # Query parameters
  my $user = $self->param('user') || '';
  my $pass = $self->param('pass') || '';

  # Check password
  return $self->render(text => "Welcome $user.")
    if $self->users->check($user, $pass);

  # Failed
  $self->render(text => 'Wrong username or password.');
};

app->start;