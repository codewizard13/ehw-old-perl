#!/usr/bin/perl -w

print "\n";

# do this forever
for (;;)

{

     # get input from user
     print "enter a number: ";

     my $num1 = <STDIN>;
     chomp $num1;

     print "enter a second number: ";

     my $num2 = <STDIN>;
     chomp $num2;

# perform simple numeric operations
my $sum = $num1 + $num2;
my $diff = $num1 - $num2;

print "\n";
print "the sum of $num1 and $num2 is $sum\n";
print "the difference of $num1 and $num2 is $diff\n";

if ($num1 == $num2)

{

     print "the numbers are equal.\n";

}

elsif ($num1 < $num2)

{

     print "$num1 is less than $num2\n";

}

elsif ($num1 > $num2)

{

     print "$num1 is greater than $num2\n";

}

print "\n";

}


$hold = <STDIN>;