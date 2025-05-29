use Mojolicious::Lite;

# Render the template "index.html.ep"
get '/' => sub {
  my $self = shift;
  $self->render;
} => 'index';

# Render the template "hello.html.ep"
get '/hello';

app->start;
__DATA__

@@ index.html.ep
<%= link_to Hello  => 'hello' %>.
<%= link_to Reload => 'index' %>.

@@ hello.html.ep
Hello World!

# all works!