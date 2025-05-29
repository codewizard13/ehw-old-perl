use Mojolicious::Lite;

# Access request information
get '/agent' => sub {
  my $self = shift;
  my $host = $self->req->url->to_abs->host;
  my $ua   = $self->req->headers->user_agent;
  $self->render(text => "Request by $ua reached $host.");
};

# Echo the request body and send custom header with response
post '/echo' => sub {
  my $self = shift;
  $self->res->headers->header('X-Bender' => 'Bite my shiny metal ass!');
  $self->render(data => $self->req->body);
};

app->start;

#get works, but post doesn't work without some other code.