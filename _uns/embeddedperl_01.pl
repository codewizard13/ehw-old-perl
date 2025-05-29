use Mojolicious::Lite;

use XML::Parser::Expat;

my $output = '';
my $i = 10;
$output .= '<ul>';
for my $j (1 .. $i) {
  $output .= '<li>';
  $output .= xml_escape scalar $j;
  $output .= '</li>';
}
$output .= '</ul>';
return $output;