use Mojolicious::Lite;

# /hello
get '/hello' => [format => 0] => {text => 'No format detection.'};

# Disable detection and allow the following routes selective re-enabling
under [format => 0];

# /foo
get '/foo' => {text => 'No format detection again.'};

# /bar.txt
get '/bar' => [format => 'txt'] => {text => ' Just one format.'};

app->start;