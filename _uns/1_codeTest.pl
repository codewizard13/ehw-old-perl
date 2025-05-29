#!/usr/bin/perl -w
use strict;
use warnings;

# Purpose is to have a sandbox to test code snippets
#


##############################################################################
#my @fruit_types = qw(apple pear orange kiwi 'washington apples' peach lime grape);
#
#foreach my $fruit (@fruit_types)
#{
#  print "Fruit: $fruit\n";
#}
#
#
#my $name = "Moriarty";
#
#my @lastNameLetters = split ('',$name);
#
#print "First letter of $name is $lastNameLetters[0]\n\n";
#
#foreach my $letter (@lastNameLetters)
#{
#  print "$letter\n";
#}



##############################################################################
#my $name = "Charles Francis Xavier";
############################
## PROCESS NAME
#my @names = split ' ', $name;  # parse full name
#
## index 0,1,-1 represent first, middle, and last names respectively
#my $first_name = $names[0];
#my $middle_name;
#my $last_name = $names[-1];
#my $middle_initial = 'X';  # initialize to the default "X"
#
## if 2nd element not the same as last element then we have a middle name
#if ($names[1] ne $names[-1])
#{
#	# no middle name so print X
#	$middle_name = $names[1];
#	my @middle_name_letters = split '', $middle_name;
#	$middle_initial = "$middle_name_letters[0].";
#}
#print "$first_name $middle_initial $last_name\n";
#
#
#$name = "Hiram K. Hackenbacker";
############################
## PROCESS NAME
#@names = split ' ', $name;  # parse full name
#
## index 0,1,-1 represent first, middle, and last names respectively
#$first_name = $names[0];
#$last_name = $names[-1];
#$middle_initial = 'X';  # initialize to the default "X"
#
## if 2nd element not the same as last element then we have a middle name
#if ($names[1] ne $names[-1])
#{
#	# no middle name so print X
#	$middle_name = $names[1];
#	my @middle_name_letters = split '', $middle_name;
#	$middle_initial = "$middle_name_letters[0].";
#}
#print "$first_name $middle_initial $last_name\n";
#
#$name = "James Moriarty";
############################
## PROCESS NAME
#@names = split ' ', $name;  # parse full name
#
## index 0,1,-1 represent first, middle, and last names respectively
#$first_name = $names[0];
#$last_name = $names[-1];
#$middle_initial = 'X';  # initialize to the default "X"
#
## if 2nd element not the same as last element then we have a middle name
#if ($names[1] ne $names[-1])
#{
#	# no middle name so print X
#	$middle_name = $names[1];
#	my @middle_name_letters = split '', $middle_name;
#	$middle_initial = "$middle_name_letters[0].";
#}
#print "$first_name $middle_initial $last_name\n";
#
#$name = "Samuel Finley Breese Morse";
############################
## PROCESS NAME
#@names = split ' ', $name;  # parse full name
#
## index 0,1,-1 represent first, middle, and last names respectively
#$first_name = $names[0];
#$last_name = $names[-1];
#$middle_initial = 'X';  # initialize to the default "X"
#
## if 2nd element not the same as last element then we have a middle name
#if ($names[1] ne $names[-1])
#{
#	# no middle name so print X
#	$middle_name = $names[1];
#	my @middle_name_letters = split '', $middle_name;
#	$middle_initial = "$middle_name_letters[0].";
#}
#print "$first_name $middle_initial $last_name\n";
#
##Next, add code after each assignment to $name that will print out the name in
##a "sanitized" form of "First M. Last"; that is, first name, space, middle
##initial, period, space, last name. 
##
##If there is no middle name, print the letter X with no period following it.
#If there are multiple middle names, use the initial of the first one.



##############################################################################
#my @nameArray = (
#  'Charles Francis Xavier',
#  'Hiram K. Hackenbacker',
#  'James Moriarty',
#  'Samuel Finley Breese Morse',
#);
#
#foreach my $name (@nameArray)
#{
#  my @names = split ' ', $name;
#  # index 0,1,-1 represent first, middle, and last names respectively
#  my $first_name = $names[0];
#  my $middle_name;
#  my $last_name = $names[-1];
#  my $middle_initial = 'X';  # initialize to the default "X"
#  
#  # if 2nd element not the same as last element then we have a middle name
#  if ($names[1] ne $names[-1])
#  {
#    # no middle name so print X
#    $middle_name = $names[1];
#    #print "middle_name = $middle_name\n";
#    my @middle_name_letters = split '', $middle_name;
#    $middle_initial = "$middle_name_letters[0].";
#  }
#  print "$first_name $middle_initial $last_name\n";
#    
#}
#



##############################################################################
#An array is defined as follows: 
my @Beatles = qw(John Paul George Ringo);

# Arrange the following statements so that the result of executing them in that
# order is that the array is back to its original state (same four elements in the same order):

my ($drummer, @vocals); # 1) declare variables
$drummer = pop @Beatles; # 2) drummer = Ringo, Beatles = John Paul George
# TRACING ...
print "\$drummer: $drummer\n";
print "\@vocals:  @vocals\n";
print "\@Beatles: @Beatles\n\n";

push @vocals, shift @Beatles; # take first element of b and put at end of v
# TRACING ...
print "\$drummer: $drummer\n";
print "\@vocals:  @vocals\n";
print "\@Beatles: @Beatles\n\n";

push @vocals, shift @Beatles;


push @vocals, shift @Beatles;
# TRACING ...
print "\$drummer: $drummer\n";
print "\@vocals:  @vocals\n";
print "\@Beatles: @Beatles\n\n";

push @Beatles, 'Pete Best';


unshift @Beatles, @vocals; # take the whole all v and put at front of b
shift @Beatles;
push @Beatles, $drummer;

# TRACING ...
print "\$drummer: $drummer\n";
print "\@vocals:  @vocals\n";
print "\@Beatles: @Beatles\n\n";
