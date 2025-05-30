#!/usr/bin/perl -w

print "\n";

# set a file variable equal to a file:

print ("Enter the path of the file you wish to WRITE to: \n");
print "\n";

$file1 = <STDIN>;
print "\n";

open(FILE, ">$file");      # Open for output
print FILE "This line goes to the file.\n";
print FILE "";
print FILE "Eric wrote this line of text";
print FILE ":";
print FILE "END";
close(FILE);               # Close the file



$line = <FILE>;

while ($line ne "") {

     print ($line);

     $line = <FILE>;

}

print "\n";

#----------
$hold = <STDIN>;    