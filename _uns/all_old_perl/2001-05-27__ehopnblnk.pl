#!/usr/bin/perl -w
#
# Allow user to create a file that does not
# exist yet. Once file is created, open it for
# writing and writes a brief test msg.

print "\n";

print "Enter your name: ";

$name = <STDIN>;

print "\n";

print "Hello, $name!  What file would you like to create? \n";
print "\n";

$file = <STDIN>;


#----------
# Create file and write to it:
#

open (FILE,">$file") || die "cannot open file $file: $!.";
print FILE "Hello, $name!\n";
close (FILE) or die "Error closing file $file: $!.";

#----------
# Read file to screen:
#

print "\n";

open FILE, $file or die "Cannot open $file for read :$!";

while (<FILE>) {
  
     print "Line $. is : $_";
}



print "\n";



#----------
$hold = <STDIN>;