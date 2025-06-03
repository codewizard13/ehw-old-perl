#!/usr/bin/perl -w
# File eh_mailpipedcmd.pl created by Eric Hepperle at 15:00:42 on Wed Aug 29 2001. 
#
# Program:	eh_mailpipedcmd.pl
# Creator:	Eric Hepperle
# Date:		08/29/01
#
# Purpose:	Demonstrates usage of simple
#		conditional statement using a
#		loop.
#
##################################################
#
# NOTES:	THIS VERSION WORKS!!!


&mainsub;


#--- SUBROUTINES ---#

sub mainsub {

print "Enter a number: ";
$num1 = <STDIN>;
chomp $num1;

print "Enter a second number: ";
$num2 = <STDIN>;
chomp $num2;
print "\n";

$sum = $num1 + $num2;

print "The sum of $num1 and $num2 = $sum\n\n";

&yesorno;


}


sub yesorno {

print "Would you like to go again? ";
$ans = <STDIN>;
chomp $ans;
print "\n";


   if ($ans =~ /^[Yy][Ee][Ss]$/ || $ans =~ /^[Yy]/) {

      print "You chose an AFFIRMATIVE response!\n\n";
      print "Returning to Home --> ............\n\n";

      &mainsub;

   } else {

      print "You chose a NEGATIVE or INVALID response\n\n";

   }


}

