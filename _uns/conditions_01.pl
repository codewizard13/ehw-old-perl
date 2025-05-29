use Mojolicious::Lite;

# Firefox
get '/foo' => (agent => qr/Firefox/) => sub {
  my $self = shift;
  $self->render(text => 'Congratulations, you are using a cool browser.');
};

# Internet Explorer
get '/foo' => (agent => qr/Internet Explorer/) => sub {
  my $self = shift;
  $self->render(text => 'Dude, you really need to upgrade to Firefox.');
};

# Chrome
get '/foo' => (agent => qr/Chrome/) => sub {
  my $self = shift;
  $self->render(text => 'Boo! Mojo hates Chrome!');
};

# http://mojolicio.us/bar
get '/bar' => (host => 'mojolicio.us') => sub {
  my $self = shift;
  $self->render(text => 'Hello Mojolicious.');
};

app->start;