#!/usr/bin/perl -w

print "\n";

# set a file variable equal to a file:

print ("Enter the path of the file you wish to list out: \n");
print "\n";

$file1 = <STDIN>;
print "\n";

unless (open (MYFILE, "$file1")) {

     die ("cannot open $file1\n");

     $hold = <STDIN>;

}

# If the prog. gets this far, then open was successful
#

$line = <MYFILE>;

while ($line ne "") {

     print ($line);

     $line = <MYFILE>;

}

print "\n";


#----------
$hold = <STDIN>;    