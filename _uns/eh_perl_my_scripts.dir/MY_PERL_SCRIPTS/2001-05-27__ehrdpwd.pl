#!/usr/bin/perl -w

# Program to open the password file, read it in,
# print it, and close it again.

$file = '/etc/passwd.txt';          # Name the file
open(INFO, $file);              # Open the file
@lines = <INFO>;          # Read it into an array
close(INFO);                    # Close the file
print @lines;                   # Print the array

#----------
$hold = <STDIN>;