use Mojolicious::Lite;

# Render template "templates/foo/bar.html.ep"
any '/external' => sub {
  my $self = shift;
  $self->render('foo/bar');
};

app->start;