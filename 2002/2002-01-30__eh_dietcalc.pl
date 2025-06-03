#!/usr/bin/perl
#
# Program:	eh_dietcalc.pl
# Creator:	Eric Hepperle
# Date:	01/30/02
#
# Purpose:	Based on Arnold Schwarzenegger's Encyclopedia of Modern Bodybuilding.  User enters some info and this program calculates recommended values for use in planning a balanced, healthy diet.
#
#
##################################################
#


print "\n\n";
print "This program is called $0\n\n";


##################################################
# GET INFO FROM USER:					 #
##################################################
#

print "The purpose to this program is to help you plan\n";
print "a balanced healthy diet, good for losing fat and\n";
print "gaining lean muscle at the same time.\n\n";

print "=============================================\n\n";

print "How Much Do you Weigh (lbs.)? ";
$cur_weight = <STDIN>;
chomp $cur_weight;
print "\n";

print "How many lbs do you want to lose? ";
$lbs2lose = <STDIN>;
chomp $lbs2lose;
print "\n";

print "How soon do you want to lose this fat (in months)? ";
$losefat_period = <STDIN>;
chomp $losefat_period;
print "\n";


# Calculate recommended calorie reduction per month.
$losecals_permo = sprintf("%.2f", $lbs2lose * 3500);
#
# TRACING:
print "\$losecals_permo =\t $losecals_permo\n\n";

# calculate recommended calorie reduction per week.
$losecals_perwk = sprintf("%.2f", $losecals_permo / 4.33);
#
# TRACING:
print "\$losecals_perwk =\t $losecals_perwk\n\n";

# calculate recommended calorie reduction per day.
$losecals_perday = sprintf("%.2f", $losecals_perwk / 7);
#
# TRACING:
print "\$losecals_perday =\t $losecals_perday\n\n";


print "\a\n";

print "               ------  ------  ------\n";
print "\nIn order to lose fat, the total calories you eat\n";
print "per day should should be less than the calories you burn\n";
print "through exercise\n\n";


print "If you weigh $cur_weight to lose $lbs2lose lbs in\n";
print "$losefat_period month(s) you should reduce your\n";
print "daily calorie consumption by $losecals_perday calories.\n\n";

# should eat 1 gram protein / 2.2lbs of body weight.
$recprot_perday = $cur_weight / 2.2;

print "Recommended Protein/day =\t $recprot_perday g.\n\n";


print "=============================================\n\n";

sub set_values {

   # Recommended Diet compositon:
   #
   # Protein:		12%
   # Carbohydrates:	58%
   # Fat:			30%
   #
   # 1b Fat = 3,500 calories
   #
   # Avg male body fat = 15%

}


sub extraformattest {

@numbers = (284832094823098, 2398203, 458694508, 0000043.35, 1.236009, 10000, 1, 2, 8.315);

$width = 15; printf "%*g\n", $width, $_ for @numbers; 

printf "=%5.5s=\n", substr("1234567890", 0, $_) for 0..10; 

$num1 = 10405211.459;

$cnum1 = sprintf("%***,***,***.2d", $num1);
print "cnum = $cnum1.\n\n";

}

#----------
$hold = <STDIN>;