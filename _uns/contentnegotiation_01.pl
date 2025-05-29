use Mojolicious::Lite;

# /hello (Accept: application/json)
# /hello (Accept: application/xml)
# /hello.json
# /hello.xml
# /hello?format=json
# /hello?format=xml
get '/hello' => sub {
  my $self = shift;
  $self->respond_to(
    json => {json => {hello => 'world'}},
    xml  => {text => '<hello>world</hello>'},
    any  => {data => '', status => 204}
  );
};

app->start;