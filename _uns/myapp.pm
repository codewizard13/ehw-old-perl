# Application
package MyApp;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;

  # Router
  my $r = $self->routes;

  # Route
  $r->route('/welcome')->to(controller => 'foo', action => 'welcome');
}

1;