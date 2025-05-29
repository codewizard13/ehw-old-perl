#!/usr/bin/perl -w
#
# This script illustrates examples from
# ch 1.5 of Level 3

print "\n";

@bob = (2,6,8);

# without double quotes or the newline char.
# the result is all elements on one line w/
# no spaces between any of them and no blank
# buffer line befor the next string
#
print (@bob);
print "\n";

@doug = @bob;
print (@doug);
print "\n";

@bob = 1;
print (@bob);
print "\n";

@bob = (2,6,8);
@doug =(3,4,@bob,5,8);

# equals "(3 4 2 6 8 5 8)"
print "(@doug)\n";

# equals "3 4 2 6 8 5 8"
print "@doug\n";
print "\n";

# adds a 2 to the end of @bob
@bob = (@bob, 2);
print "@bob\n";
print "\n";


# adds a 5 at the beginning of @bob
@bob = (5, @bob);
print "@bob\n";
print "\n";

# assigns 2 to $x, 6 to $y, and 8 to $z.
($x, $y, $z) = (2,6,8);

# swaps the values of $x and $y.
($x, $y) = ($y, $x);

# assigns 2 to $x and (6,8) to @arry.
($x, @arry) = (2,6,8);

# assigns the first value of @arry to $x and
# the remaining values to @arry.
($x, @arry) = @arry;

# initializes @bob.
@bob = (1,2,3,4,5);

# assigns lenth of @bob,(l=5), to $bob.
$bob = @bob;

# assigns 1 to $bob since this is an array assignment.
($bob) = @bob;

# evaluates to 2 since subtraction operator
# expects a scalar value.
@bob - 3;

# assigns (1,2,3) to @bob and @doug.
@bob = (@doug = (1,2,3));

# same as above.
@bob = @doug = (1,2,3);

# assigns (1,2,3) to @bob.
@bob = (1,2,3);

# assigns 3 to $doug.
$doug = $bob[2];

# assigns 22 to second element of @bob.
$bob[1] = 22;


# increment the second element of @bob.
$bob[1] ++;

# add 4 to the second element of @bob.
$bob[1] += 4;

# swap the first and second elements of @bob.
($bob[0], $bob[1]) = ($bob[1], $bob[0]);


# SLICE STUFF:
#----------

# swap the first and second elements of @bob.
@bob[0,1] = @bob[1,0];

# assigns the first element value to the
# first 3 elements of @bob.
@bob[0,1,2] = @bob[0,0,0];

# assigns 2 and 3 to the first two elements
# of @bob.
@bob[0,1] = (2,3);



# ARRAY AS PUSH/POP STACK:
#----------

# adds the value 1 to the end of @bob.
push(@bob, 1);

# adds the current value of $doug to @bob.
push(@bob, $doug);

# adds 1,2,3, to the end of @bob.
push(@bob, 1,2,3);

# removes the last element of @bob and
# assigns its value to $doug.
$doug = pop(@bob);



# NEGATIVE SUBSCRIPTS OF ARRAY:
#----------

# initialize @bob.
@bob = qw(5,3,6,7,three, six, 7ofnine);

# prints the last element of @bob.
print "the last element of \@bob = $bob[-1] \n";
print "\n";

print "the 2nd-to-last element of \@bob = $bob[-2] \n";
print "\n";

print "@bob[$x]\n";
print "\n";

# initialize @doug.
@doug = qw (arthur, merlin, gwenevuire, morgan le fey, percival);
print "@bob[@doug]\n";
print "\n";

print "@bob[$doug]\n";
print "\n";



# UNSHIFT AND SHIFT:
#----------
#
# unshift will append elements to the beginning
# of the array, and the shift cmd will retrieve
# the first element of an array:
#

# adds the value 1 to the beginning of @bob.
unshift(@bob, 1);

# adds the current value of $doug to the beginning
# of @bob.
unshift (@bob, 1,2,3);

# removes the first element of @bob and assigns
# its value to $doug.
$doug = shift (@bob);



# REVERSE:
#----------

@bob = (1,2,3);

@doug = reverse(@bob);

print "@doug \n";
print "\n";

@doug = reverse(1,2,3); # same as above.

# reverses @bob.
@bob = reverse(@bob);
print "\@bob = @bob\n";
print "\n";



# SORT:
#----------

# assigns ("aardvark, "gnu", "zebra") to @bob.
@bob = sort ("zebra", "gnu", "aardvark");
print "\@bob = @bob \n";
print "\n";

# initialize @bob.
@bob = (1,23,2,15,11);

@doug = sort(@bob);
print "@doug \n";
print "\n";



# CHOMP:
#----------

# assigns ("aardvark\n", "gnu\n", "zebra\n") to @bob.
@bob = sort ("zebra\n", "gnu\n", "aardvark\n");

print "\@bob = @bob\n";
print "\n";

# changes @bob to ("aardvark", "gnu", "zebra")
chomp (@bob);

print "chomped \@bob = @bob\n";
print "\n";



# STDIN:
#----------






#---------
$hold = <STDIN>;