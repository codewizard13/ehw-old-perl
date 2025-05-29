#!/usr/bin/perl -w

print "\n";

# create a simple string
my $string = "Good Afternoon!";

if ($string =~ /Good Afternoon!/)

{

     print ("Case Match found.\n");

}

if ($string =~ /good AFTERNOON!/i)

{

     print ("Case-insensitive match.\n");

}


$hold = <STDIN>;