#!/usr/bin/perl

print "Hello, World...\n";

%hash=(
   "scheme"    => "scheme",
   "hostname"  => "hostname",
   "port"      => port,
   "username"  => "username",
   "password"  => "password",
   "path"      => "path",
   "extrainfo" => "extrainfo",
 );




<html>
<body>
<script language="PerlScript">
$window->document->write("Hello world!");

# Added the following perl lines 04/22/01
#

$wordcount = 0;

$line = <STDIN>;

while ($line ne " ") {

   chop ($line);

   @array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;

}

print ("Total number of words: $wordcount\n");

# end.


</script>
</body>
</html>
