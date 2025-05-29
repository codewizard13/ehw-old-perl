#!/usr/bin/env/ perl
use Mojolicious::Lite;

use URI;
my $url = URI->new("http://www.thinkgeek.com/brain/whereisit.cgi?t=++star+wars");

# declare new user agent
my $ua = Mojo::UserAgent->new;

# gets all website code and prints in console
# print $ua->get('http://mojolicio.us')->res->body;

# print $ua->get('http://mojolicio.us')->res->dom->find('h1');

print $ua->get('http%3A%2F%2Fwww.thinkgeek.com%2Fbrain%2Fwhereisit.cgi%3Ft%3D%2B%2Bstar%2Bwars')->res->dom->find('h1.title-page');

