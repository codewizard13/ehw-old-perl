use Mojolicious::Lite;

# /hello
# /hello/Sara
get '/hello/:name' => {name => 'Sebastian', day => 'Monday'} => sub {
  my $self = shift;
  $self->render('groovy', format => 'txt');
};

app->start;
__DATA__

@@ groovy.txt.ep
My name is <%= $name %> and it is <%= $day %>.