use Mojolicious::Lite;

# /hello/test
# /hello/test123
# /hello/test.123/test/123
get '/hello/*you' => 'groovy';

app->start;
__DATA__

@@ groovy.html.ep
Your name is <%= $you %>.