use Mojolicious::Lite;

# Simple plain text response
get '/' => {text => 'I ♥ Mojolicious!'};

# Route associating "/time" with template in DATA section
get '/time' => 'clock';

# Scrape information from remote sites
post '/title' => sub {
  my $self  = shift;
  my $url   = $self->param('url') || 'http://mojolicio.us';
  my $title = $self->ua->get($url)->res->dom->at('title')->text;
  $self->render(json => {url => $url, title => $title});
};

# WebSocket echo service
websocket '/echo' => sub {
  my $self = shift;
  $self->on(message => sub {
    my ($self, $msg) = @_;
    $self->send("echo: $msg");
  });
};

app->start;
__DATA__

@@ clock.html.ep
% use Time::Piece;
% my $now = localtime;
The time is <%= $now->hms %>.