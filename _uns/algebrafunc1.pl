#!/usr/bin/perl
#
#
# Program:        algebrafunc1.pl
# Creator:        Eric Hepperle
# Date:        01/10/02
#
# Purpose:        Demonstrates processing a numeric function with perl using subroutines implemented as perl functions.
#
###################################################
#
# Revisions:
#
#        - Original:  01/10/02
#        - Change calculation from "a^2 = b^2 + c^2"
#           to the more traditional "a^2 + b^2 = c^2"
#
###################################################
#
# Planned Improvements:
#
###################################################
#

print "\n\n";
print "This program is called algebrafunc1.pl\n\n";

# set default values.
$a = 0;
$b = 0;
$c = 0;



# print usage if no arguments and give option to enter args.
if ($#ARGV < 0 || $ARGV[0] eq '-h') {
    print "Usage:  algebrafunc1.pl <b> <c> [-h]\n\n";
    print "Press <ENTER> to continue, or type \"exit\" to quit: ";
    $ans = <STDIN>;
    chomp $ans;

    print "\n\n";

    if ($ans eq "exit") {
       exit;
    } else {
       print "Enter the value for a:";
       $a = <STDIN>;
       chomp $a;
       print "\n\n";

       print "Enter the value for b:";
       $b = <STDIN>;
       chomp $b;
       print "\n\n";
    }

}


if ($ARGV[0]) {
    $a = $ARGV[0];
}
if ($ARGV[1]) {
    $b = $ARGV[1];
}




sub f1 {

   for (0..100) {

      $csq = ($a**2) + ($b**2);

      print "$a^2\t+ $b^2\t= c^2 =\t$csq\n";

      $a++;
      $b++;

   }

}


f1($a, $b);
print "\n\n";



# ----------------------------------------
# stop until user enters a keystroke
$hold = <STDIN>;