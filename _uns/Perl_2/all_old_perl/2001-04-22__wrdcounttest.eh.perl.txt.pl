
$wordcount = 0;

$line = <STDIN>;

while ($line ne " ") {

   chop ($line);

   @array = split(/ /, $line);

   $wordcount += @array;

   $line = <STDIN>;

}

print ("Total number of words: $wordcount\n");

