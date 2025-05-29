#!/usr/bin/perl
use strict;
use warnings;

# Grocery store inventory:
my $lines = <<'END_OF_REPORT';
0.95  300   White Peaches
1.45  120   California Avocados
5.50   10   Durien
0.40  700   Spartan Apples
END_OF_REPORT

my $searchStr = "es";

my ($line1, $line2, $line3, $line4) = split "\n", $lines;

my ($cost, $quantity, $item) = split " ", $line1, 3;
unless ( index($line1, $searchStr) == -1 )
{
  print "Total value of $item on hand = \$", $cost * $quantity, "\n";  
}

($cost, $quantity, $item) = split " ", $line2, 3;
unless ( index($line2, $searchStr) == -1 )
{
  print "Total value of $item on hand = \$", $cost * $quantity, "\n";
}

($cost, $quantity, $item) = split " ", $line3, 3;
unless ( index($line3, $searchStr) == -1 )
{
  print "Total value of $item on hand = \$", $cost * $quantity, "\n";
}

($cost, $quantity, $item) = split " ", $line4, 3;
unless ( index($line4, $searchStr) == -1 )
{
  print "Total value of $item on hand = \$", $cost * $quantity, "\n";
}

# TESTING join function
print join '*', 'a', 'b', 'c', "\n";   # a*b*c*
my $myOutput = join "*",'a', 'b', 'c';  
print "$myOutput\n";                   # a*b*c

my ($x, $y, $z) = (1, 2);
if (defined $z) { print "\$z is defined ..\n\n";}
print "x = $x\n";
print "y = $y\n";
print "z = $z\n";


