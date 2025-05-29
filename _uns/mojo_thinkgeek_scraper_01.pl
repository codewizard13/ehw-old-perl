use Mojo::UserAgent;

# Fetch web site
my $ua = Mojo::UserAgent->new;
my $tx = $ua->get('mojolicio.us/perldoc');

# Extract title
say 'Title: ', $tx->res->dom->at('head > title')->text;

# Extract headings
$tx->res->dom('h1, h2, h3')->each(sub { say 'Heading: ', shift->all_text });

# Visit all nodes recursively to extract more than just text
for my $n ($tx->res->dom->all_contents->each) {

  # Text or CDATA node
  print $n->content if $n->node eq 'text' || $n->node eq 'cdata';

  # Also include alternate text for images
  print $n->{alt} if $n->node eq 'tag' && $n->type eq 'img';
}