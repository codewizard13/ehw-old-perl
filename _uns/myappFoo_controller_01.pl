# Controller
package MyApp::Foo;
use Mojo::Base 'Mojolicious::Controller';

# Action
sub welcome {
  my $self = shift;

  # Render response
  $self->render(text => 'Hello there.');
}

1;