# #!/usr/local/bin/perl
# use Mojolicious::Lite;
# use Mojo::UserAgent;

# my $ua = Mojo::UserAgent->new;

# print $ua->get('http://mojolico.us')->res->body . "\n";

#!/usr/local/bin/perl
use Mojolicious::Lite;
use Mojo::UserAgent;

# define a new user agent object
my $ua = Mojo::UserAgent->new;

get '/' => sub {

    my $self = shift;
    $self->render(text => 'Hello!');
    
    print $ua->get('http://mojolico.us');
};



app->start;