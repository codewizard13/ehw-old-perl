use Mojolicious::Lite;

# http://localhost:3000/?name=Bender
# works!

# Authenticate based on name parameter
under sub {
  my $self = shift;

  # Authenticated
  my $name = $self->param('name') || '';
  return 1 if $name eq 'Bender';

  # Not authenticated
  $self->render('denied');
  return undef;
};

# Only reached when authenticated
get '/' => 'index';

app->start;
__DATA__

@@ denied.html.ep
You are not Bender, permission denied.

@@ index.html.ep
Hi Bender.