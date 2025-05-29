#!/usr/bin/perl -w

# Program:		eh_comp2filesnprtdiff_2.pl
# Creator:		Eric Hepperle
# Date:		09/16/01
#
#
#


$hold = ();
@a = ();
@b = ();
$hash = ();

print "This is a test\n";
$hold = <STDIN>;

#---------------------


@a = qw[ A, B, C ];
@b = qw[ A, B, D ];

foreach( @a, @b ) {

   $hash{$_}++;

}

# Now you have the hash. Step through the hash, and the values
# that equal 1 only appear in one of the arrays. The rest will have
# a value of 2


print "Here is the output:\n\n";

foreach( keys %hash ) {

   if( $hash{$_} == 1 ) {

      print "$_\n";

   }

}

# The output will be: C D 


$hold = <STDIN>;